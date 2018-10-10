#include "abmof_hw_accel.h"
#include "ap_int.h"
#include <iostream>
#include "ap_int.h"
#include "abmof_hw_accel.h"
#include "hls_stream.h"

static col_pix_t glPLSlices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdx = 0, glPLTminus1SliceIdx, glPLTminus2SliceIdx;

#define INPUT_COLS 4

void sadSum(ap_int<BITS_PER_PIXEL+1> sum[BLOCK_SIZE], int16_t *sadRet)
{
#pragma HLS INLINE off
	ap_int<16> tmp = 0;
	calOFLoop2:for(ap_uint<4> i = 0; i < BLOCK_SIZE; i++)
	{
#pragma HLS UNROLL factor=1
		if(sum[i] < 0) sum[i] = -sum[i];
//		sum[i] = sum[i] < 0 ? ap_int<BITS_PER_PIXEL+1>(-sum[i]) : sum[i];
		tmp = tmp + sum[i];
	}

	*sadRet = tmp.to_short();
}

void sad(pix_t refBlock[BLOCK_SIZE], pix_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
#pragma HLS INLINE off
#pragma HLS PIPELINE
	int16_t retVal = 0;
	ap_int<pix_t::width+1> sum[BLOCK_SIZE];
//	*sadRet = 0;

	DFRegion:
	{
		calOFLoop1:for(int16_t m = 0; m < BLOCK_SIZE; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
			sum[m] = tmpSum;
		}

		sadSum(sum, sadRet);
//		std::cout<<"sadRet is " << *sadRet << std::endl;
	}

}

void colSADSum(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1])
{
#pragma HLS INLINE off
#pragma HLS PIPELINE
#pragma HLS ARRAY_PARTITION variable=t1Col complete dim=0
#pragma HLS ARRAY_PARTITION variable=retVal complete dim=0
#pragma HLS ARRAY_PARTITION variable=t2Col complete dim=0
//	std::cout << "HW in1 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t1Col[m] << " ";
//	}
//	std::cout << std::endl;
//
//	std::cout << "HW in2 is: " << std::endl;
//	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << t2Col[m] << " ";
//	}
//	std::cout << std::endl;

	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pix_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
#pragma HLS ARRAY_PARTITION variable=input1 complete dim=0
#pragma HLS ARRAY_PARTITION variable=input2 complete dim=0
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j + SEARCH_DISTANCE];   // Get the col data centered on current event.
			input2[j] = t2Col[i+j];
		}
		sad(input1, input2, &retVal[i]);
	}

}

void blockSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[2*SEARCH_DISTANCE + 1])
{
#pragma HLS ARRAY_RESHAPE variable=sumBlock complete dim=1
#pragma HLS ARRAY_RESHAPE variable=t1Block complete dim=1
#pragma HLS ARRAY_RESHAPE variable=t2Block complete dim=1
#pragma HLS PIPELINE
#pragma HLS INTERFACE port=t2Block
#pragma HLS INTERFACE port=t1Block
//	blockSADSumLoop:for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//	{
		pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
		int16_t out[2*SEARCH_DISTANCE + 1];

		// Convert the ap_fifo input interface to wires.
		readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			in1[j] = t1Block[j];
			in2[j] = t2Block[j];
		}

		std::cout << "in1 is: " << std::endl;
		for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			std::cout << in1[j] << " ";
		}
		std::cout << std::endl;

		std::cout << "in2 is: " << std::endl;
		for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			std::cout << in2[j] << " ";
		}
		std::cout << std::endl;

		colSADSum(in1, in2, out);

		// Convert the wires to ap_fifo output interface.
		outputRetLoop:for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
		{
			sumBlock[j] = out[j];
		}
//	}
}

// Function Description: return the minimum value of an array.
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1], int8_t *index)
{
#pragma HLS INLINE off
#pragma HLS PIPELINE
#pragma HLS ARRAY_PARTITION variable=inArr complete dim=0
	ap_int<16> tmp = inArr[0];
	int8_t tmpIdx = 0;
	minLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE + 1; i++)
	{
		// Here is a bug. Use the if-else statement,
		// cannot use the question mark statement.
		// Otherwise a lot of muxs will be generated,
		// DON'T KNOW WHY. SHOULD BE A BUG.
		if(inArr[i] < tmp) tmpIdx = i;
		if(inArr[i] < tmp) tmp = inArr[i];
//		tmp = (inArr[i] < tmp) ? inArr[i] : tmp;
	}
	*index = tmpIdx;
	return tmp;
}




pix_t readPixFromCol(col_pix_t colData, ap_uint<8> idx)
{
#pragma HLS INLINE
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

pix_t readPixFromTwoCols(two_cols_pix_t colData, ap_uint<8> idx)
{
#pragma HLS INLINE
	pix_t retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
//	ap_uint<256> colIdxHi, colIdxLo;
//	colIdxHi = (ap_uint<8>(idx * BITS_PER_PIXEL)(8,2), ap_uint<2>(0));
//	colIdxLo = (ap_uint<8>(idx * BITS_PER_PIXEL)(8,2), ap_uint<2>(BITS_PER_PIXEL - 1));
//	retData = colData(colIdxHi, colIdxLo);
	readTwoColsWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[BITS_PER_PIXEL*idx + yIndex];
	}
	return retData;
}

void writePixToCol(col_pix_t *colData, ap_uint<8> idx, pix_t pixData)
{
#pragma HLS INLINE
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < BITS_PER_PIXEL; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = BITS_PER_PIXEL >> 1;
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<10>(idx * BITS_PER_PIXEL).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<2>(yIndex);

		(*colData)[colIdx] = pixData[yIndex];
	}
}

void resetPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
#pragma HLS INLINE
	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
#pragma HLS RESOURCE variable=glPLSlices core=RAM_T2P_BRAM
#pragma HLS PIPELINE
#pragma HLS INLINE
#pragma HLS ARRAY_PARTITION variable=glPLSlices complete dim=1
#pragma HLS ARRAY_PARTITION variable=glPLSlices cyclic factor=1 dim=3
#pragma HLS DEPENDENCE variable=glPLSlices inter false
	col_pix_t tmpData;
	pix_t tmpTmpData;

	ap_uint<8> yNewIdx = y%COMBINED_PIXELS;

	tmpData = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS];

	tmpTmpData = readPixFromCol(tmpData, yNewIdx);

	tmpTmpData +=  1;

	writePixToCol(&tmpData, yNewIdx, tmpTmpData);

	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = tmpData;
}

// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
static ap_int<16> miniRetVal = 0x7fff;
static ap_uint<6> minOFRet = ap_uint<6>(0xff);
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
static ap_int<16> localSumReg[BLOCK_SIZE][2*SEARCH_DISTANCE + 1];

static uint16_t eventIterSize = 100;

void miniSADSum(pix_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t shiftCnt,
		ap_int<16> *miniSumRet,
		ap_uint<6> *OFRet
		)
{
#pragma HLS ARRAY_PARTITION variable=localSumReg complete dim=0
#pragma HLS INLINE
#pragma HLS ARRAY_RESHAPE variable=t1Block complete dim=1
#pragma HLS ARRAY_RESHAPE variable=t2Block complete dim=1
#pragma HLS PIPELINE
	ap_int<16> miniRetValTmpIter;

	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		in1[j] = t1Block[j];
		in2[j] = t2Block[j];
	}

//	miniRetVal = (shiftCnt == 1) ? ap_int<16>(0x7fff) : miniRetVal;
//
//	initMiniSumLoop : for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//	{
//		miniSumTmp[i] = (shiftCnt == 1) ? ap_int<16>(0) : miniSumTmp[i];
//	}

	colSADSum(in1, in2, out);

	ap_uint<1> cond1 = (shiftCnt > BLOCK_SIZE - 1) ? 1 : 0;
//	std::cout << "shiftCnt is: " << shiftCnt << std::endl;
//	std::cout << "cond1 is: " << cond1 << std::endl;
//
//	std::cout << "localSumReg[0] from HW is: " << std::endl;
//	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << localSumReg[0][m] << " ";
//	}
//	std::cout << std::endl;

	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		ap_int<16> tmpMiniSumTmp = miniSumTmp[i] + out[i];
		ap_int<16> tmpMinius = tmpMiniSumTmp - localSumReg[0][i];
		miniSumTmp[i] = (shiftCnt > BLOCK_SIZE) ? tmpMinius : tmpMiniSumTmp;  // Notice: this condition is not cond1.
//		miniRetVal = (miniRetValTmpIter < miniSumTmp[i]) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniSumTmp[i];
//		else miniRetVal[i] = miniRetVal[i];
	}

//	std::cout << "miniSumTmp from HW is: " << std::endl;
//	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//	{
//		std::cout << miniSumTmp[m] << " ";
//	}
//	std::cout << std::endl;
//
//	std::cout << "Old miniRetVal from HW is: " << miniRetVal << std::endl;

	int8_t retIdx;
	miniRetValTmpIter = min(miniSumTmp, &retIdx);
	ap_uint<1> cond2 = (miniRetValTmpIter < miniRetVal) ? 1 : 0;

	// Use a new register to store the old value and use the return value as the new value.
//	miniRetVal = (miniRetValTmpIter < miniRetVal) && (shiftCnt > 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniRetVal;
	miniRetVal = (cond2) && (cond1) ? miniRetValTmpIter : miniRetVal;

//	std::cout << "New miniRetVal from HW is: " << miniRetVal << std::endl;

	// TODO: change the localSumReg to a hls stream with depth BLOCK_SIZE.
	shiftMainLoop: for(int8_t i = 0; i < BLOCK_SIZE - 1; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	shiftLastLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[BLOCK_SIZE - 1][j] = out[j];
	}

	*miniSumRet = miniRetVal;

	ap_uint<3> OFRet_x = shiftCnt - BLOCK_SIZE;
	ap_uint<3> OFRet_y = ap_uint<3>(retIdx);

	minOFRet = (cond2) && (cond1) ? ap_uint<6>(OFRet_y.concat(OFRet_x)) : minOFRet;  // TODO: add a flag to indicate the result valid or not. Use 0 to represent the invalid result.
	*OFRet = minOFRet;

//	std::cout << "miniSumRetHW is: " << *miniSumRet << "\t OFRetHW is: " << std::hex << *OFRet << std::endl;
//	std::cout << std::dec;    // Restore dec mode
}


void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
#pragma HLS INLINE
#pragma HLS PIPELINE
#pragma HLS ARRAY_RESHAPE variable=refCol complete dim=1
#pragma HLS ARRAY_RESHAPE variable=tagCol complete dim=1

		two_cols_pix_t refColData;
		// concatenate two columns together
		refColData = (glPLSlices[sliceIdxRef][x][y/COMBINED_PIXELS], glPLSlices[sliceIdxRef][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// concatenate two columns together
		two_cols_pix_t tagColData;
		// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
		tagColData = (glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

		// find the bottom pixel of the column that centered on y.
		ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

		readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
		{
			refCol[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
			tagCol[i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
			yColOffsetIdx++;
		}

}

void readBlockColsAndMiniSADSum(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, int16_t shiftCnt, ap_int<16> *miniSumRet)
{
#pragma HLS INLINE
	pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	ap_uint<6> OFRet;

	readBlockCols(x, y , idx + 1, idx + 2, in1, in2);
	miniSADSum(in1, in2, shiftCnt, miniSumRet, &OFRet);
}


void getXandY(const uint64_t * data, hls::stream<uint8_t>  &xStream, hls::stream<uint8_t> &yStream, hls::stream<apUint17_t> &packetEventDataStream)
//void getXandY(const uint64_t * data, int32_t eventsArraySize, ap_uint<8> *xStream, ap_uint<8> *yStream)
{
#pragma HLS INLINE off

	// Every event always consists of 2 int32_t which is 8bytes.
	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
#pragma HLS PIPELINE
		uint64_t tmp = data[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

//		writePix(xWr, yWr, glPLActiveSliceIdx);
//		resetPix(xWr, yWr, glPLActiveSliceIdx + 3);

//		shiftCnt = 0;
//		miniRetVal = 0x7fff;
//		for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//		{
//				miniSumTmp[i] = 0;
//		}
//		for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
//		{
//			for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
//			{
//				localSumReg[i][j] = 0;
//			}
//		}

		xStream << xWr;
		yStream << yWr;
		packetEventDataStream << apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
//		*xStream++ = xWr;
//		*yStream++ = yWr;
	}
}


static uint16_t areaEventRegs[AREA_NUMBER][AREA_NUMBER];
static uint16_t areaEventThr = 1000;

void rotateSlice(hls::stream<uint8_t>  &xInStream, hls::stream<uint8_t> &yInStream,
				 hls::stream<uint8_t> &xOutStream, hls::stream<uint8_t> &yOutStream, hls::stream<sliceIdx_t> &idxStream)
{
#pragma HLS RESOURCE variable=areaEventRegs core=RAM_2P_LUTRAM
#pragma HLS ARRAY_PARTITION variable=areaEventRegs complete dim=2
#pragma HLS INLINE off
//	glPLActiveSliceIdx--;

	rotateSliceOutLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		ap_uint<8> x, y;
		x = xInStream.read();
		y = yInStream.read();

		uint16_t c = areaEventRegs[x/AREA_SIZE][y/AREA_SIZE];
		c = c + 1;
		areaEventRegs[x/AREA_SIZE][y/AREA_SIZE] = c;


		// The area threshold reached, rotate the slice index and clear the areaEventRegs.
		if (c > areaEventThr)
		{
			glPLActiveSliceIdx--;

            for(int r = 0; r < 1000; r++)
            {
                std::cout << "Rotated successfully!!!!" << std::endl;
                std::cout << "x is: " << x << "\t y is: " << y << "\t idx is: " << glPLActiveSliceIdx << std::endl;
            }


			rotateSliceResetLoop:for(int areaX = 0; areaX < AREA_NUMBER; areaX++)
			{
#pragma HLS PIPELINE
#pragma HLS INLINE off
				for(int areaY = 0; areaY < AREA_NUMBER; areaY++)
				{
					areaEventRegs[areaX][areaY] = 0;
				}
			}

//		   for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
//		   {
//			   resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdx + 3));
//			   resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdx + 3));
//		   }
		}

		xOutStream.write(x);
		yOutStream.write(y);
		idxStream.write(glPLActiveSliceIdx);
	}
}

void rwSlices(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
			  hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut)
{
#pragma HLS INLINE off
	ap_uint<8> xRd;
	ap_uint<8> yRd;
	sliceIdx_t idx;
	sliceIdx_t oldIdx;

	rwSlicesLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		rwSlicesInnerLoop:for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; xOffSet++)
		{
#pragma HLS PIPELINE
//			xRd = (xOffSet == 0)? (ap_uint<8>)(xStream.read()): xRd;
//			yRd = (xOffSet == 0)? (ap_uint<8>)(yStream.read()): yRd;
			if (xOffSet == 0)
			{
				xRd = xStream.read();
				yRd = yStream.read();
				idx = idxStream.read();

				/* This is only for C-simulation and debugging. */
//				if (i == 0) oldIdx = idx;
//				if (oldIdx != idx)
//				{
//					oldIdx = idx;
//					// Check the accumulation slice is clear or not
//					for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
//					{
//						for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
//						{
//							if (glPLSlices[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
//							{
//								for(int r = 0; r < 1000; r++)
//								{
//									std::cout << "Ha! I caught you, the pixel which is not clear!" << std::endl;
//									std::cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << std::endl;
//								}
//							}
//						}
//					}
//				}

				writePix(xRd, yRd, idx);

				resetPix(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i/(PIXS_PER_COL), (i % (PIXS_PER_COL) + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i, 64, (sliceIdx_t)(idx + 3));
//				resetPix(i, 96, (sliceIdx_t)(idx + 3));

//				resetPix(i, 128, (sliceIdx_t)(idx + 3));
//				resetPix(i, 160, (sliceIdx_t)(idx + 3));
//				resetPix(i, 192, (sliceIdx_t)(idx + 3));
//				resetPix(i, 224, (sliceIdx_t)(idx + 3));
			}
			else
			{
				pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

	//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

				readBlockCols(xRd + xOffSet - 1, yRd , idx + 1, idx + 2, out1, out2);

				apIntBlockCol_t refBlockCol;
				apIntBlockCol_t tagBlockCol;

				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
					tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
				}

				refStreamOut << refBlockCol;
				tagStreamOut << tagBlockCol;
			}
		}
	}

	resetLoop: for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
#pragma HLS PIPELINE
		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
	}

}

void miniSADSumWrapper(hls::stream<apIntBlockCol_t> &refStreamIn, hls::stream<apIntBlockCol_t> &tagStreamIn, hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream)
//void miniSADSumWrapper(ap_uint<8> *xStream, ap_uint<8> *yStream, sliceIdx_t idx, int32_t eventsArraySize, ap_int<16> *miniSumRet)
{
#pragma HLS INLINE off
	wrapperLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		ap_int<16> miniRet;
		ap_uint<6> OFRet = 0;    // TODO: maybe change the initial value.
		innerLoop_1: for (int8_t k = 0; k < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; k++)
		{
#pragma HLS PIPELINE
			if (k == 0)    // Initialization code
			{
				miniRetVal = ap_int<16>(0x7fff);
				minOFRet = ap_uint<6>(0xff);

				initMiniSumLoop : for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
				{
					miniSumTmp[j] = ap_int<16>(0);
				}
			}
			else
			{
				pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

				apIntBlockCol_t refBlockCol = refStreamIn.read();
				apIntBlockCol_t tagBlockCol = tagStreamIn.read();

				// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
				// to calculate the range function. However, unroll it completely will make all this operations
				// are only wires connection and will not consume any resources.
				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					in1[l] = refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
					in2[l] = tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				}

				miniSADSum(in1, in2, k, &miniRet, &OFRet);   // Here k starts from 1 not 0.
			}
		}
		miniSumStream.write(apUint15_t(miniRet));
		OFRetStream.write(apUint6_t(OFRet));
	}
}

void outputResult(hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream,  hls::stream<apUint17_t> &packetEventDataStream, int32_t *eventSlice)
{
	outputLoop: for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS PIPELINE
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		apUint17_t tmp1 = packetEventDataStream.read();
		ap_int<9> tmp2 = miniSumStream.read().range(8, 0);
		apUint6_t tmpOF = OFRetStream.read();
		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
		*eventSlice++ = output.to_int();
	}
}

#pragma SDS data access_pattern(data:SEQUENTIAL, eventSlice:SEQUENTIAL)
// #pragma SDS data data_mover(data:AXIFIFO:1, eventSlice:AXIFIFO:2)
// #pragma SDS data buffer_depth(data:512, eventSlice:1)
#pragma SDS data data_mover(data:AXIDMA_SIMPLE:1, eventSlice:AXIDMA_SIMPLE:2)
#pragma SDS data copy(data[0:eventsArraySize], eventSlice[0:eventsArraySize])
#pragma SDS data mem_attribute(data:PHYSICAL_CONTIGUOUS, eventSlice:PHYSICAL_CONTIGUOUS)
// #pragma SDS data zero_copy(eventSlice[0:eventsArraySize])
void parseEvents(const uint64_t * data, int32_t eventsArraySize, int32_t *eventSlice)
{
#pragma HLS INTERFACE axis register both port=data
#pragma HLS INTERFACE axis register both port=eventSlice
//#pragma HLS INTERFACE s_axilite port=return bundle=control
	DFRegion:
	{
#pragma HLS DATAFLOW
		hls::stream<uint8_t>  xInStream("xInStream"), yInStream("yInStream");
#pragma HLS RESOURCE variable=yInStream core=FIFO_SRL
#pragma HLS RESOURCE variable=xInStream core=FIFO_SRL
		hls::stream<uint8_t>  xOutStream("xOutStream"), yOutStream("yOutStream");
		hls::stream<sliceIdx_t> idxStream("idxStream");
		hls::stream<apUint17_t> pktEventDataStream("EventStream");
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL
#pragma HLS STREAM variable=pktEventDataStream depth=2 dim=1
		hls::stream<apUint6_t> OFRetStream("OFStream");
		hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
#pragma HLS RESOURCE variable=tagStreamIn core=FIFO_SRL
#pragma HLS STREAM variable=tagStreamIn depth=2 dim=1
#pragma HLS RESOURCE variable=refStream core=FIFO_SRL
#pragma HLS STREAM variable=refStream depth=2 dim=1
		hls::stream<apUint15_t> miniSumStream("miniSumStream");
#pragma HLS RESOURCE variable=miniSumStream core=FIFO_SRL
#pragma HLS STREAM variable=miniSumStream depth=2 dim=1


		eventIterSize = eventsArraySize;

		getXandY(data, xInStream, yInStream, pktEventDataStream);
		rotateSlice(xInStream, yInStream, xOutStream, yOutStream, idxStream);
		rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
		miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
		outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice);

	}
}
