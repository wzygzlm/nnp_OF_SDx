#include "abmof.h"
#include "readBlocks.h"
#include <iostream>
#include "ap_int.h"
// xfopencv
//#include "xf_headers.h"
//#include "xf_dense_npyr_optical_flow_config.h"

#include <math.h>

#include "sds_utils.h"

// Current slice index
static ap_uint<2> currentIdx = 0;

static uint64_t imgNum = 0;
static bool initSocketFlg = false;
static uint16_t retSocket;

static int32_t *eventSlice = (int32_t *)sds_alloc(DVS_HEIGHT * DVS_WIDTH);

// To trigger the tcp to send event slice
static bool sendFlg = false;

static void *displayTCP(void *);

static void *displayUDP(void *);

static col_pix_t slices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];

static void resetPixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	slices[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

static void writePixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	int8_t yNewIdx = y%COMBINED_PIXELS;
	cout << "Data before write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
	pix_t tmp = slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
	tmp += 1;
	slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) = tmp;
	cout << "Data after write : " << slices[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
}


static void readBlockColsSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	two_cols_pix_t refColData;
	// concatenate two columns together
	refColData = (slices[sliceIdxRef][x][y/COMBINED_PIXELS + 1], slices[sliceIdxRef][x][y/COMBINED_PIXELS]);
//	cout << "refColData: " << refColData.range(255, 192) << endl;

	// concatenate two columns together
	two_cols_pix_t tagColData;
	// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
	tagColData = (slices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS + 1], slices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS]);

	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refCol[i] = refColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		tagCol[i] = tagColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		yColOffsetIdx++;
	}
}

static void topSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePixSW(x, y, idx);
	readBlockColsSW(x, y - BLOCK_SIZE/2 - SEARCH_DISTANCE, idx + 1, idx + 2, refCol, tagCol);
	resetPixSW(x, y, idx + 3);
}


int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, int port, int eventThreshold, int socketType)
{
	int j = 0;
    int err_cnt = 0;

	pix_t refColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColSW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t refColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagColHW[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for (auto &tmpEvent : *polarityPkt)
	{
		j++;
		int32_t ts = tmpEvent.getTimestamp();
		uint16_t x = tmpEvent.getX();
		uint16_t y = tmpEvent.getY();
		bool pol   = tmpEvent.getPolarity();

	    sds_utils::perf_counter hw_ctr, sw_ctr;

	    sw_ctr.start();
		topSW(ap_uint<8>(x), ap_uint<8>(y), currentIdx, refColSW, tagColSW);
	    sw_ctr.stop();

	    hw_ctr.start();
		topHW(ap_uint<8>(x), ap_uint<8>(y), currentIdx, refColHW, tagColHW);
		hw_ctr.stop();

		for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			cout << "refColSW is: " << endl;
			for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
			{
				cout << refColSW[m] << " ";
			}
			cout << endl;

			cout << "tagColSW is: " << endl;
			for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
			{
				cout << tagColSW[m] << " ";
			}
			cout << endl;

			cout << "refColHW is: " << endl;
			for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
			{
				cout << refColHW[m] << " ";
			}
			cout << endl;

			cout << "tagColHW is: " << endl;
			for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
			{
				cout << tagColHW[m] << " ";
			}
			cout << endl;

			if((refColHW[i] != refColSW[i]) || (tagColHW[i] != tagColSW[i]))
			{
				printf("Current event - ts: %d, x: %d, y: %d, pol: %d.\n", ts, x, y, pol);
				cout << "idx : " << currentIdx << endl;

				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << j << " !!!" << endl;
			}
		}

	    uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
	    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();
	    double speedup = (double) sw_cycles / (double) hw_cycles;

	    std::cout << "Number of CPU cycles running application in software: "
	                << sw_cycles << std::endl;
	    std::cout << "Number of CPU cycles running application in hardware: "
	                << hw_cycles << std::endl;
	    std::cout << "Speed up: " << speedup << std::endl;
	    std::cout << "Note: Speed up is meaningful for real hardware execution only, not for emulation." << std::endl;
	}
//	printf("eventSize is %d, eventCap is %d, i is %d", polarity->getEventNumber(), polarity->getEventCapacity(), i);

	return 4096;
}
