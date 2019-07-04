#ifndef ABMOF_HW_ACCEL
#define ABMOF_HW_ACCEL

#include<stdint.h>
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"

#define MAX_SIZE_PER_DATA_PKT 50000

#define SLICES_NUMBER 4
#define SLICE_WIDTH  256
#define SLICE_HEIGHT 256

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 32

#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3
#define AREA_NUMBER 8
#define AREA_SIZE (SLICE_WIDTH/AREA_NUMBER)

#define BLOCK_COL_PIXELS BITS_PER_PIXEL * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)
#define COL_BITS BITS_PER_PIXEL * (BLOCK_SIZE)

typedef ap_axiu<64,1,1,1> inputDataElement;
typedef ap_axiu<32,1,1,1> outputDataElement_t;

typedef ap_int<BITS_PER_PIXEL> pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pixs_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL * 2> two_cols_pix_t;
typedef ap_uint<2> sliceIdx_t;

typedef ap_int<BLOCK_COL_PIXELS> apIntBlockCol_t;
typedef ap_int<COL_BITS> apIntColBits_t;
typedef ap_uint<17> apUint17_t;
typedef ap_uint<15> apUint15_t;
typedef ap_uint<6> apUint6_t;
typedef ap_uint<1> apUint1_t;
typedef ap_uint<16 * (2 * SEARCH_DISTANCE + 1)> apUint112_t;
typedef ap_uint<6 * (2 * SEARCH_DISTANCE + 1)> apUint42_t;

#define BLOCK_COL_PIXELS BITS_PER_PIXEL * (BLOCK_SIZE + 2 * SEARCH_DISTANCE)
#define PIXS_PER_COL (SLICE_HEIGHT/COMBINED_PIXELS)



#define DEBUG 0

#define DVS_WIDTH  204

#define POLARITY_SHIFT 1
#define POLARITY_MASK 0x00000001
#define POLARITY_Y_ADDR_SHIFT 2
#define POLARITY_Y_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs
#define POLARITY_X_ADDR_SHIFT 17
#define POLARITY_X_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs

typedef ap_uint<49> apUint49_t;
typedef ap_uint<17> apUint17_t;
typedef ap_uint<15> apUint15_t;
typedef ap_uint<6> apUint6_t;
typedef ap_uint<1> apUint1_t;

// Change these two together
#define RESHAPE_FACTOR 16
#define DVS_HEIGHT RESHAPE_FACTOR*10

#define X_TYPE ap_uint<8>
#define Y_TYPE ap_uint<8>

// Change them together
#define TS_TYPE_BIT_WIDTH 32
#define LOG_TS_TYPE_BIT_WIDTH 5   // Log(TS_TYPE_BIT_WIDTH), used in pix read and pix write

#define col_pix_t ap_uint<RESHAPE_FACTOR * TS_TYPE_BIT_WIDTH>


#define INNER_SIZE 16
#define OUTER_SIZE 20

#define TEST_SORT_DATA_SIZE 10

#define MERGE_STAGES 5

#define SYMBOL_BITS 5

#define LOOPS_PER_EVENT 2   // To process one event, how many loops are required

//#define SIZE 16
void mergeSortParallelWithSize(ap_uint<TS_TYPE_BIT_WIDTH> A[OUTER_SIZE], ap_uint<8> num_symbols,  ap_uint<TS_TYPE_BIT_WIDTH> B[OUTER_SIZE]);
void insertionCellSort(ap_uint<TS_TYPE_BIT_WIDTH> inData[20], ap_uint<TS_TYPE_BIT_WIDTH> outputData[20]);

template<int DATA_SIZE, int NPC>
void insertionSortParallel(ap_uint<TS_TYPE_BIT_WIDTH> A[DATA_SIZE], ap_uint<TS_TYPE_BIT_WIDTH> B[DATA_SIZE]);

void testSortHW(ap_uint<TS_TYPE_BIT_WIDTH> inputA[TEST_SORT_DATA_SIZE], ap_uint<TS_TYPE_BIT_WIDTH> outputB[TEST_SORT_DATA_SIZE]);
void testSortedIdxData(ap_uint<TS_TYPE_BIT_WIDTH> inData[OUTER_SIZE], ap_uint<5> newIdx[OUTER_SIZE]);

void testRwSAEHW(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts, ap_uint<2>  stage, ap_uint<TS_TYPE_BIT_WIDTH> outputData[OUTER_SIZE], ap_uint<5> *size);
void testIdxDataToIdxInnerBoolDataHW(ap_uint<5> newIdx[OUTER_SIZE], ap_uint<5> size, ap_uint<4> condFlg[INNER_SIZE]);
void testFromTsDataCheckInnerCornerHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner);
void testFromTsDataCheckOuterCornerHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner);
void testFromTsDataToIdxDataHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<5> idxData[OUTER_SIZE]);
void testFromTsDataToIdxInnerBoolDataHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<4> idxBoolData[OUTER_SIZE]);
void testFromTsDataToInnerCornerHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner);
void testFromTsDataToOuterCornerHW(ap_uint<TS_TYPE_BIT_WIDTH> inputRawData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner);
void fastCornerInnerHW(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts, ap_uint<2>  stage, ap_uint<1> *isCorner);
void fastCornerOuterHW(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts, ap_uint<2>  stage, ap_uint<1> *isCorner);
void fastCornerHW(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts, ap_uint<1> *isCorner);
void parseEvents(const uint64_t * data, int32_t eventsArraySize, uint64_t *eventSlice, ap_uint<1> *outLed);

#endif
