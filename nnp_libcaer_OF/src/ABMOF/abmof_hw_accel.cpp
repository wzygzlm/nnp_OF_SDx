#include "abmof_hw_accel.h"
#include "ap_int.h"
#include <iostream>
#include "ap_int.h"
#include "abmof_hw_accel.h"
#include "hls_stream.h"

static col_pix_t glPLSlices[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static col_pix_t glPLSlicesScale1[SLICES_NUMBER][SLICE_WIDTH/2][SLICE_HEIGHT/COMBINED_PIXELS/2];
static col_pix_t glPLSlicesScale2[SLICES_NUMBER][SLICE_WIDTH/4][SLICE_HEIGHT/COMBINED_PIXELS/4];
static sliceIdx_t glPLActiveSliceIdx = 0, glPLTminus1SliceIdx, glPLTminus2SliceIdx;
static uint16_t eventIterSize = 100;

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
#pragma HLS PIPELINE
#pragma HLS INLINE off
	int16_t retVal = 0;
	ap_int<pix_t::width+1> sum[BLOCK_SIZE];
//	*sadRet = 0;

	DFRegion:
	{
//		calOFLoop1:for(int16_t m = 0; m < BLOCK_SIZE; m++)
//		{
//			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
//			sum[m] = tmpSum;
//		}

		calOFDSPLoop: for(uint8_t m = 0; m < 5; m++)
		{
			ap_int<5> tmpSum = refBlock[m] - targetBlocks[m];
#pragma HLS RESOURCE variable=tmpSum core=AddSub_DSP
			sum[m] = tmpSum;
		}

		calOFNoDSPLoop: for(uint8_t m = 5; m < BLOCK_SIZE; m++)
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
		int refTmpZeroCnt = 0, tagTmpZeroCnt = 0;
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
			input1[j] = t1Col[j + SEARCH_DISTANCE];   // Get the col data centered on current event.
			input2[j] = t2Col[i+j];
			refTmpZeroCnt++;
			tagTmpZeroCnt++;
		}
		sad(input1, input2, &retVal[i]);
	}

}

// This function is used to calculate the number of non-zero pixels in ref block, tag block
// and the number of the number of identical non-zero pixels between both of them.
// TODO: continue to optimize this module.
void colZeroCnt(pix_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pix_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],  ap_uint<6> *refColZeroCnt,
			ap_uint<6> tagValidPixCnt[2 * SEARCH_DISTANCE + 1],
			ap_uint<6> refTagValidPixCnt[2 * SEARCH_DISTANCE + 1])
{
#pragma HLS ARRAY_PARTITION variable=refTagValidPixCnt complete dim=1
#pragma HLS ARRAY_PARTITION variable=tagValidPixCnt complete dim=1
#pragma HLS PIPELINE
#pragma HLS ARRAY_PARTITION variable=t2Col complete dim=1
#pragma HLS ARRAY_PARTITION variable=t1Col complete dim=1
	int refTmpZeroCnt = 0, tagTmpZeroCnt = 0;
	ap_uint< BLOCK_SIZE > refValidPixFlgBits, tagValidPixFlgBits;
	for(int i = 0; i < BLOCK_SIZE; i++)
	{
		ap_uint<1> refTmpBool = t1Col[i + SEARCH_DISTANCE].bit(0);
		ap_uint<1> tagTmpBool = t2Col[i].bit(0);
		for (int j = 1; j < BITS_PER_PIXEL; j++)
		{
			refTmpBool |= t1Col[i + SEARCH_DISTANCE].bit(j);
			tagTmpBool |= t2Col[i].bit(j);
		}
		refTmpZeroCnt +=  refTmpBool;
		tagTmpZeroCnt +=  tagTmpBool;

//		if (t1Col[i + SEARCH_DISTANCE].or_reduce())   // Get the col data centered on current event.
//		{
//		  refTmpZeroCnt++;
//		}
	}

	tagValidPixCnt[0] = tagTmpZeroCnt;
	for(int m = 1; m <= 2 * SEARCH_DISTANCE; m++)
	{
		ap_uint<1> tmpBool1 = t2Col[m - 1].bit(0);
		for (int j = 1; j < BITS_PER_PIXEL; j++)
		{
			tmpBool1 |= t2Col[m - 1].bit(j);
		}

		ap_uint<1> tmpBool2 = t2Col[BLOCK_SIZE + m - 1].bit(0);
		for (int j = 1; j < BITS_PER_PIXEL; j++)
		{
			tmpBool2 |= t2Col[BLOCK_SIZE + m - 1].bit(j);
		}

//		ap_uint<1> refTagTmpBool1 = (t1Col[m - 1 + SEARCH_DISTANCE].bit(0) == t2Col[m - 1].bit(0)) & (t2Col[m - 1].bit(0) != 0);
//		ap_uint<1> refTagTmpBool2 = (t1Col[BLOCK_SIZE + m - 1 + SEARCH_DISTANCE].bit(0) == t2Col[BLOCK_SIZE + m - 1].bit(0)) & (t2Col[BLOCK_SIZE + m - 1].bit(0) != 0);
//
		tagValidPixCnt[m] = tagValidPixCnt[m - 1] + tmpBool2 - tmpBool1;
//		refTagValidPixCnt[m] = tagValidPixCnt[m - 1] + refTagTmpBool2 - refTagTmpBool1;
	}

	for(int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		int refTagTmpZeroCnt = 0;
		for(int n = 0; n < BLOCK_SIZE; n++)
		{
			ap_uint<1> refTmpBool = (t1Col[n + SEARCH_DISTANCE] != 0);
			ap_uint<1> tagTmpBool = (t2Col[n + m] != 0);
//			for (int j = 1; j < BITS_PER_PIXEL; j++)
//			{
//				refTmpBool |= t1Col[n + SEARCH_DISTANCE].bit(j);
//				tagTmpBool |= t2Col[n + m].bit(j);
//			}

			ap_uint<1> refTagTmpBool = refTmpBool & tagTmpBool;
			refTagTmpZeroCnt += refTagTmpBool;
		}
		refTagValidPixCnt[m] = refTagTmpZeroCnt;
	}

	*refColZeroCnt = refTmpZeroCnt;
}


// Function Description: return the minimum value of an array.
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1], int8_t *index)
{
#pragma HLS PIPELINE
#pragma HLS ARRAY_RESHAPE variable=inArr complete dim=1
#pragma HLS INLINE off
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
	glPLSlicesScale1[sliceIdx][x/2][y/COMBINED_PIXELS/2] = 0;
	glPLSlicesScale2[sliceIdx][x/4][y/COMBINED_PIXELS/4] = 0;
}

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
#pragma HLS DEPENDENCE variable=glPLSlicesScale2 inter false
#pragma HLS DEPENDENCE variable=glPLSlicesScale1 inter false
#pragma HLS RESOURCE variable=glPLSlicesScale2 core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=glPLSlicesScale2 cyclic factor=1 dim=3
#pragma HLS ARRAY_PARTITION variable=glPLSlicesScale2 complete dim=1
#pragma HLS RESOURCE variable=glPLSlicesScale1 core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=glPLSlicesScale1 cyclic factor=1 dim=3
#pragma HLS ARRAY_PARTITION variable=glPLSlicesScale1 complete dim=1
#pragma HLS PIPELINE
#pragma HLS RESOURCE variable=glPLSlices core=RAM_T2P_BRAM
#pragma HLS INLINE
#pragma HLS ARRAY_PARTITION variable=glPLSlices complete dim=1
#pragma HLS ARRAY_PARTITION variable=glPLSlices cyclic factor=1 dim=3
#pragma HLS DEPENDENCE variable=glPLSlices inter false
	col_pix_t tmpData;
	pix_t tmpTmpData;

	ap_uint<8> yNewIdx = y%COMBINED_PIXELS;

	tmpData = glPLSlices[sliceIdx][x][y/COMBINED_PIXELS];

	tmpTmpData = readPixFromCol(tmpData, yNewIdx);

	ap_uint<1> cmpFlg = ap_uint<1>(tmpTmpData < (ap_uint< BITS_PER_PIXEL - 1 >(0xff)));
	tmpTmpData +=  cmpFlg;

	writePixToCol(&tmpData, yNewIdx, tmpTmpData);

	glPLSlices[sliceIdx][x][y/COMBINED_PIXELS] = tmpData;

    // write scale 1
    ap_uint<8> xScale1 = x/2;
    ap_uint<8> yScale1 = y/2;
    ap_uint<8> yNewIdxScale1 = yScale1%COMBINED_PIXELS;

	col_pix_t tmpDataScale1;
	pix_t tmpTmpDataScale1;

	tmpDataScale1 = glPLSlicesScale1[sliceIdx][xScale1][yScale1/COMBINED_PIXELS];
	tmpTmpDataScale1 = readPixFromCol(tmpDataScale1, yNewIdxScale1);
	ap_uint<1> cmpFlgScale1 = ap_uint<1>(tmpTmpDataScale1 < (ap_uint< BITS_PER_PIXEL - 1 >(0xff)));
	tmpTmpDataScale1 +=  cmpFlgScale1;
	writePixToCol(&tmpDataScale1, yNewIdxScale1, tmpTmpDataScale1);
    glPLSlicesScale1[sliceIdx][xScale1][yScale1/COMBINED_PIXELS] = tmpDataScale1;

    // write scale 2
    // write scale 1
    ap_uint<8> xScale2 = x/4;
    ap_uint<8> yScale2 = y/4;
    ap_uint<8> yNewIdxScale2 = yScale2%COMBINED_PIXELS;

	col_pix_t tmpDataScale2;
	pix_t tmpTmpDataScale2;

	tmpDataScale2 = glPLSlicesScale2[sliceIdx][xScale2][yScale2/COMBINED_PIXELS];
	tmpTmpDataScale2 = readPixFromCol(tmpDataScale2, yNewIdxScale2);
	ap_uint<1> cmpFlgScale2 = ap_uint<1>(tmpTmpDataScale2 < (ap_uint< BITS_PER_PIXEL - 1 >(0xff)));
	tmpTmpDataScale2 +=  cmpFlgScale2;
	writePixToCol(&tmpDataScale2, yNewIdxScale2, tmpTmpDataScale2);
    glPLSlicesScale2[sliceIdx][xScale2][yScale2/COMBINED_PIXELS] = tmpDataScale2;
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
    two_cols_pix_t tagColData;
    ap_uint<3> neighboryOffset;
    if ( y%COMBINED_PIXELS < BLOCK_SIZE/2 + SEARCH_DISTANCE )
    {
        neighboryOffset = y/COMBINED_PIXELS - 1;
    }
    else
    {
        neighboryOffset = y/COMBINED_PIXELS + 1;
    }

    // concatenate two columns together
    refColData = (glPLSlices[sliceIdxRef][x][y/COMBINED_PIXELS], glPLSlices[sliceIdxRef][x][neighboryOffset]);
    //	cout << "refColData: " << refColData << endl;
    // concatenate two columns together
    // Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
    tagColData = (glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], glPLSlices[(sliceIdx_t)(sliceIdxTag + 0)][x][neighboryOffset]);

	// find the bottom pixel of the column that centered on y.
	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refCol[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
		tagCol[i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
		yColOffsetIdx++;
	}

}


void readBlockColsScale1(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refColScale1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagColScale1[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
#pragma HLS ARRAY_RESHAPE variable=tagColScale1 complete dim=1
#pragma HLS ARRAY_RESHAPE variable=refColScale1 complete dim=1
#pragma HLS PIPELINE
#pragma HLS INLINE

	two_cols_pix_t refColData;
    two_cols_pix_t tagColData;
    ap_uint<3> neighboryOffset;
    if ( y%COMBINED_PIXELS < BLOCK_SIZE/2 + SEARCH_DISTANCE )
    {
        neighboryOffset = y/COMBINED_PIXELS - 1;
    }
    else
    {
        neighboryOffset = y/COMBINED_PIXELS + 1;
    }

    // concatenate two columns together
    refColData = (glPLSlicesScale1[sliceIdxRef][x][y/COMBINED_PIXELS], glPLSlicesScale1[sliceIdxRef][x][neighboryOffset]);
    //	cout << "refColData: " << refColData << endl;
    // concatenate two columns together
    // Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
    tagColData = (glPLSlicesScale1[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], glPLSlicesScale1[(sliceIdx_t)(sliceIdxTag + 0)][x][neighboryOffset]);

	// find the bottom pixel of the column that centered on y.
	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refColScale1[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
		tagColScale1[i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
		yColOffsetIdx++;
	}
}

void readBlockColsScale2(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refColScale2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t tagColScale2[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
#pragma HLS ARRAY_RESHAPE variable=tagColScale2 complete dim=1
#pragma HLS ARRAY_RESHAPE variable=refColScale2 complete dim=1
#pragma HLS PIPELINE
#pragma HLS INLINE

	two_cols_pix_t refColData;
    two_cols_pix_t tagColData;
    ap_uint<3> neighboryOffset;
    if ( y%COMBINED_PIXELS < BLOCK_SIZE/2 + SEARCH_DISTANCE )
    {
        neighboryOffset = y/COMBINED_PIXELS - 1;
    }
    else
    {
        neighboryOffset = y/COMBINED_PIXELS + 1;
    }

    // concatenate two columns together
    refColData = (glPLSlicesScale2[sliceIdxRef][x][y/COMBINED_PIXELS], glPLSlicesScale2[sliceIdxRef][x][neighboryOffset]);
    //	cout << "refColData: " << refColData << endl;
    // concatenate two columns together
    // Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
    tagColData = (glPLSlicesScale2[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], glPLSlicesScale2[(sliceIdx_t)(sliceIdxTag + 0)][x][neighboryOffset]);

	// find the bottom pixel of the column that centered on y.
	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refColScale2[i] = readPixFromTwoCols(refColData,  yColOffsetIdx);
		tagColScale2[i] = readPixFromTwoCols(tagColData,  yColOffsetIdx);
		yColOffsetIdx++;
	}
}

void getXandY(const uint64_t * data, hls::stream<uint8_t>  &xStream, hls::stream<uint8_t> &yStream, hls::stream<uint32_t> &tsStream, hls::stream<apUint17_t> &packetEventDataStream)
//void getXandY(const uint64_t * data, int32_t eventsArraySize, ap_uint<8> *xStream, ap_uint<8> *yStream)
{
#pragma HLS INLINE off
#pragma HLS INLINE off

	// Every event always consists of 2 int32_t which is 8bytes.
//	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
//	{
		uint64_t tmp = *data;
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		uint32_t ts = tmp >> 32;

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
		tsStream << ts;
		packetEventDataStream << apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
//		*xStream++ = xWr;
//		*yStream++ = yWr;
//	}
}

static uint16_t areaEventRegs[AREA_NUMBER][AREA_NUMBER];
static uint16_t areaEventThr = 1000;

void rotateSliceNoRotationFlg(hls::stream<uint8_t>  &xInStream, hls::stream<uint8_t> &yInStream,
				 hls::stream<uint8_t> &xOutStream, hls::stream<uint8_t> &yOutStream, hls::stream<sliceIdx_t> &idxStream)
{
#pragma HLS RESOURCE variable=areaEventRegs core=RAM_2P_LUTRAM
#pragma HLS ARRAY_PARTITION variable=areaEventRegs complete dim=2
#pragma HLS INLINE off
//	glPLActiveSliceIdx--;

//	rotateSliceOutLoop:for(int32_t i = 0; i < eventIterSize; i++)
//	{
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

            for(int r = 0; r < 1; r++)
            {
                std::cout << "Rotated successfully from HW!!!!" << std::endl;
                std::cout << "x is: " << x << "\t y is: " << y << "\t idx is: " << glPLActiveSliceIdx << std::endl;
            }


			rotateSliceLoop:for(int areaX = 0; areaX < AREA_NUMBER; areaX++)
			{
#pragma HLS PIPELINE
				rotateSliceInnerLoop:for(int areaY = 0; areaY < AREA_NUMBER; areaY++)
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
//	}
}

apUint1_t glRotateFlg = 0;
// areaEventThr is occupied by feedback, here we use another value to copy its initial value.
// Remember to update this value when areaEventThr is updated.
uint16_t areaEventThrBak = areaEventThr;
static uint32_t lastTsHW = 0, currentTsHW = 0;
static ap_uint<9> deltaTsHW;
void rotateSlice(hls::stream<uint8_t>  &xInStream, hls::stream<uint8_t> &yInStream, hls::stream<uint32_t> &tsInStream, hls::stream<uint16_t> &thrStream,
				 hls::stream<uint8_t> &xOutStream, hls::stream<uint8_t> &yOutStream,
				 hls::stream<sliceIdx_t> &idxStream)
{
#pragma HLS RESOURCE variable=areaEventRegs core=RAM_2P_LUTRAM
#pragma HLS ARRAY_PARTITION variable=areaEventRegs complete dim=2
#pragma HLS INLINE off
//	glPLActiveSliceIdx--;

	ap_uint<8> x, y;
	x = xInStream.read();
	y = yInStream.read();
	uint32_t ts = tsInStream.read();

	uint16_t c = areaEventRegs[x/AREA_SIZE][y/AREA_SIZE];
	c = c + 1;
	areaEventRegs[x/AREA_SIZE][y/AREA_SIZE] = c;

	uint16_t tmpThr = 1000;

	if (!thrStream.empty()) tmpThr = thrStream.read();

	glRotateFlg = 0;
	// The area threshold reached, rotate the slice index and clear the areaEventRegs.
	if (c >= tmpThr)
	{
		glPLActiveSliceIdx--;
		glRotateFlg = 1;

        lastTsHW = currentTsHW;
        currentTsHW = ts;

        for(int r = 0; r < 1; r++)
		{
			std::cout << "Rotated successfully from HW!!!!" << std::endl;
			std::cout << "x is: " << x << "\t y is: " << y << "\t idx is: " << glPLActiveSliceIdx << std::endl;
			std::cout << "delataTsHW is: " << ((currentTsHW - lastTsHW) >> 9) << std::endl;
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
	deltaTsHW = ((currentTsHW - lastTsHW) >> 9);
}



void readSlices(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
		hls::stream<uint8_t> &xWrStream, hls::stream<uint8_t> &yWrStream, hls::stream<sliceIdx_t> &idxWrStream,
		hls::stream<col_pix_t> &currentPixStream, hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut)
{
	ap_uint<8> xRd;
	ap_uint<8> yRd;
	sliceIdx_t idx;

	readSlicesInnerLoop:for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; xOffSet++)
	{
#pragma HLS PIPELINE rewind
		if (xOffSet == 0)
		{
			xRd = xStream.read();
			yRd = yStream.read();
			idx = idxStream.read();

			col_pix_t tmpData;

			tmpData = glPLSlices[idx][xRd][yRd/COMBINED_PIXELS];

			xWrStream.write(xRd);
			yWrStream.write(yRd);
			idxWrStream.write(idx);
			currentPixStream.write(tmpData);
		}
		else
		{
			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

			readBlockCols(xRd - BLOCK_SIZE/2 - SEARCH_DISTANCE + xOffSet - 1, yRd , idx + 1, idx + 2, out1, out2);

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

// It takes 2048 cycles to reset the whole slice, so we use 11 bits.
static ap_uint<11> resetCnt;
void writeSlices(hls::stream<uint8_t> &xWrStream, hls::stream<uint8_t> &yWrStream, hls::stream<sliceIdx_t> &idxWrStream,
		hls::stream<col_pix_t> &currentColStream)
{
	ap_uint<8> xWr;
	ap_uint<8> yWr;
	sliceIdx_t idx;
	col_pix_t currentColData;

	writeSlicesInnerLoop:for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1; xOffSet++)
	{
		if (xOffSet == 0)
		{
			xWr = xWrStream.read();
			yWr = yWrStream.read();
			idx = idxWrStream.read();
			currentColData = currentColStream.read();

			pix_t tmpTmpData;
			ap_uint<8> yNewIdx = yWr%COMBINED_PIXELS;

			tmpTmpData = readPixFromCol(currentColData, yNewIdx);

			tmpTmpData +=  1;

			writePixToCol(&currentColData, yNewIdx, tmpTmpData);

			glPLSlices[idx][xWr][yWr/COMBINED_PIXELS] = currentColData;
		}
		else
		{
			resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
			resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
			resetCnt += 2;
		}
	}
}

sliceIdx_t oldIdx = glPLActiveSliceIdx;
void rwSlices(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
			  hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut,
			  hls::stream<apIntBlockCol_t> &refStreamOutScale1, hls::stream<apIntBlockCol_t> &tagStreamOutScale1,
			  hls::stream<apIntBlockCol_t> &refStreamOutScale2, hls::stream<apIntBlockCol_t> &tagStreamOutScale2)
{
#pragma HLS INLINE off
	ap_uint<8> xRd;
	ap_uint<8> yRd;
	sliceIdx_t idx;

	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//	rwSlicesLoop:for(int32_t i = 0; i < eventIterSize; i++)
//	{
		rwSlicesInnerLoop:for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE * (2 * SEARCH_DISTANCE + 1); xOffSet++)
		{
#pragma HLS PIPELINE rewind
//			xRd = (xOffSet == 0)? (ap_uint<8>)(xStream.read()): xRd;
//			yRd = (xOffSet == 0)? (ap_uint<8>)(yStream.read()): yRd;
			if (xOffSet == 0)
			{
				xRd = xStream.read();
				yRd = yStream.read();
				idx = idxStream.read();

				/* This is only for C-simulation and debugging. */
				if (oldIdx != idx)
				{
					oldIdx = idx;
					// Check the accumulation slice is clear or not
					for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
					{
						for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
						{
							if (glPLSlices[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
							{
								for(int r = 0; r < 1000; r++)
								{
									std::cout << "Ha! I caught you, the pixel which is not clear!" << std::endl;
									std::cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << std::endl;
								}
							}
						}
					}
				}

				writePix(xRd, yRd, idx);

				resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
				resetCnt++;
			}
			else if(xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1)
			{
				pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
				pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	            pix_t out1Scale1[BLOCK_SIZE+ 2 * SEARCH_DISTANCE];
	            pix_t out2Scale1[BLOCK_SIZE+ 2 * SEARCH_DISTANCE];

	            pix_t out1Scale2[BLOCK_SIZE+ 2 * SEARCH_DISTANCE];
	            pix_t out2Scale2[BLOCK_SIZE+ 2 * SEARCH_DISTANCE];

				readBlockCols(xRd - BLOCK_SIZE/2 - SEARCH_DISTANCE + xOffSet - 1, yRd , idx + 1, idx + 2, out1, out2);
				readBlockColsScale1(xRd/2 - BLOCK_SIZE/2 - SEARCH_DISTANCE + xOffSet - 1, yRd/2 , idx + 1, idx + 2, out1Scale1, out2Scale1);
				readBlockColsScale2(xRd/4 - BLOCK_SIZE/2 - SEARCH_DISTANCE + xOffSet - 1, yRd/4 , idx + 1, idx + 2, out1Scale2, out2Scale2);

				apIntBlockCol_t refBlockCol;
				apIntBlockCol_t tagBlockCol;

				apIntBlockCol_t refBlockColScale1;
				apIntBlockCol_t tagBlockColScale1;

				apIntBlockCol_t refBlockColScale2;
				apIntBlockCol_t tagBlockColScale2;

				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
					tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];

					refBlockColScale1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1Scale1[l];
					tagBlockColScale1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2Scale1[l];

					refBlockColScale2.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1Scale2[l];
					tagBlockColScale2.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2Scale2[l];
				}

				if (xOffSet > SEARCH_DISTANCE && xOffSet <= SEARCH_DISTANCE + BLOCK_SIZE)
				{
					refStreamOut << refBlockCol;
					refStreamOutScale1 <<  refBlockColScale1;
					refStreamOutScale2 <<  refBlockColScale2;
				}
				tagStreamOut << tagBlockCol;
				tagStreamOutScale1 << tagBlockColScale1;
				tagStreamOutScale2 << tagBlockColScale2;
			}
			else
			{
				// Reset two pixels at the same time because it has two write ports.
				resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
				resetCnt++;
				resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
				resetCnt++;
			}
		}
//	}

//	resetLoop: for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
//	{
//		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//		resetPix(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//	}

}

// Function description: reorder the column stream read directly from the memory slices.
void colStreamToColSum(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<apUint112_t> &outStream, hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
#pragma HLS RESOURCE variable=colData1 core=RAM_2P_LUTRAM
#pragma HLS RESOURCE variable=colData0 core=RAM_2P_LUTRAM

	colStreamToColSum_label1:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		colStreamToColSum_label2:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apIntBlockCol_t tmpData0, tmpData1;

			if(i == 0)
			{
				colData0[k] = colStream0.read();
				colData1[k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[k];
			}
			else
			{
				if((i == 1) && (k < 2 * SEARCH_DISTANCE))  colData1[BLOCK_SIZE + k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[i + k];
			}

			pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			int16_t out[2*SEARCH_DISTANCE + 1];
			ap_uint<6> refColZeroCnt, tagColValidCnt[2*SEARCH_DISTANCE + 1], refTagValidPixCnt[2*SEARCH_DISTANCE + 1];

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = tmpData0.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = tmpData1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			colSADSum(in1, in2, out);

			colZeroCnt(in1, in2, &refColZeroCnt, tagColValidCnt, refTagValidPixCnt);

			apUint112_t outputData;
			apUint42_t tagColValidOutputData, refTagValidOutputData;

			for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
			{
				outputData.range(16 * l + 15, 16 * l) = out[l];
				tagColValidOutputData.range(6 * l + 5, 6 * l) = tagColValidCnt[l];
				refTagValidOutputData.range(6 * l + 5, 6 * l) = refTagValidPixCnt[l];
			}

			refZeroCntStream.write(refColZeroCnt);
			outStream.write(outputData);
			tagColValidCntStream.write(tagColValidOutputData);
			refTagValidCntStream.write(refTagValidOutputData);
		}
	}
}

// Function description: reorder the column stream read directly from the memory slices.
void colStreamToColSumScale1(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<apUint112_t> &outStream, hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
#pragma HLS RESOURCE variable=colData1 core=RAM_2P_LUTRAM
#pragma HLS RESOURCE variable=colData0 core=RAM_2P_LUTRAM

	colStreamToColSum_label1:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		colStreamToColSum_label2:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apIntBlockCol_t tmpData0, tmpData1;

			if(i == 0)
			{
				colData0[k] = colStream0.read();
				colData1[k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[k];
			}
			else
			{
				if((i == 1) && (k < 2 * SEARCH_DISTANCE))  colData1[BLOCK_SIZE + k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[i + k];
			}

			pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			int16_t out[2*SEARCH_DISTANCE + 1];
			ap_uint<6> refColZeroCnt, tagColValidCnt[2*SEARCH_DISTANCE + 1], refTagValidPixCnt[2*SEARCH_DISTANCE + 1];

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = tmpData0.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = tmpData1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			colSADSum(in1, in2, out);

			colZeroCnt(in1, in2, &refColZeroCnt, tagColValidCnt, refTagValidPixCnt);

			apUint112_t outputData;
			apUint42_t tagColValidOutputData, refTagValidOutputData;

			for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
			{
				outputData.range(16 * l + 15, 16 * l) = out[l];
				tagColValidOutputData.range(6 * l + 5, 6 * l) = tagColValidCnt[l];
				refTagValidOutputData.range(6 * l + 5, 6 * l) = refTagValidPixCnt[l];
			}

			refZeroCntStream.write(refColZeroCnt);
			outStream.write(outputData);
			tagColValidCntStream.write(tagColValidOutputData);
			refTagValidCntStream.write(refTagValidOutputData);
		}
	}
}

// Function description: reorder the column stream read directly from the memory slices.
void colStreamToColSumScale2(hls::stream<apIntBlockCol_t> &colStream0, hls::stream<apIntBlockCol_t> &colStream1,
		hls::stream<apUint112_t> &outStream, hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
#pragma HLS RESOURCE variable=colData1 core=RAM_2P_LUTRAM
#pragma HLS RESOURCE variable=colData0 core=RAM_2P_LUTRAM

	colStreamToColSum_label1:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		colStreamToColSum_label2:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apIntBlockCol_t tmpData0, tmpData1;

			if(i == 0)
			{
				colData0[k] = colStream0.read();
				colData1[k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[k];
			}
			else
			{
				if((i == 1) && (k < 2 * SEARCH_DISTANCE))  colData1[BLOCK_SIZE + k] = colStream1.read();

				tmpData0 = colData0[k];
				tmpData1 = colData1[i + k];
			}

			pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			int16_t out[2*SEARCH_DISTANCE + 1];
			ap_uint<6> refColZeroCnt, tagColValidCnt[2*SEARCH_DISTANCE + 1], refTagValidPixCnt[2*SEARCH_DISTANCE + 1];

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = tmpData0.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = tmpData1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			colSADSum(in1, in2, out);

			colZeroCnt(in1, in2, &refColZeroCnt, tagColValidCnt, refTagValidPixCnt);

			apUint112_t outputData;
			apUint42_t tagColValidOutputData, refTagValidOutputData;

			for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
			{
				outputData.range(16 * l + 15, 16 * l) = out[l];
				tagColValidOutputData.range(6 * l + 5, 6 * l) = tagColValidCnt[l];
				refTagValidOutputData.range(6 * l + 5, 6 * l) = refTagValidPixCnt[l];
			}

			refZeroCntStream.write(refColZeroCnt);
			outStream.write(outputData);
			tagColValidCntStream.write(tagColValidOutputData);
			refTagValidCntStream.write(refTagValidOutputData);
		}
	}
}



void rwSlicesAndColStreams(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
							hls::stream<apUint112_t> &outStream)
{
	ap_uint<8> xRd;
	ap_uint<8> yRd;
	sliceIdx_t idx;

	apIntBlockCol_t colData0[BLOCK_SIZE], colData1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	// This loop is used to readSlices and fill the buffers.
	rwSlicesLoop:for(uint8_t xOffSet = 0; xOffSet < BLOCK_SIZE * (2 * SEARCH_DISTANCE + 1); xOffSet++)
	{
//			xRd = (xOffSet == 0)? (ap_uint<8>)(xStream.read()): xRd;
//			yRd = (xOffSet == 0)? (ap_uint<8>)(yStream.read()): yRd;
		if (xOffSet == 0)
		{
			xRd = xStream.read();
			yRd = yStream.read();
			idx = idxStream.read();

			/* This is only for C-simulation and debugging. */
			if (oldIdx != idx)
			{
				oldIdx = idx;
				// Check the accumulation slice is clear or not
				for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
				{
					for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
					{
						if (glPLSlices[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
						{
							for(int r = 0; r < 1000; r++)
							{
								std::cout << "Ha! I caught you, the pixel which is not clear!" << std::endl;
								std::cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << std::endl;
							}
						}
					}
				}
			}

			writePix(xRd, yRd, idx);

			resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
			resetCnt++;
		}
		else if(xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE + 1)
		{
			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			uint8_t realOffset = xOffSet - 1;

			readBlockCols(xRd - BLOCK_SIZE/2 - SEARCH_DISTANCE + realOffset, yRd , idx + 1, idx + 2, out1, out2);

			apIntBlockCol_t refBlockCol;
			apIntBlockCol_t tagBlockCol;

			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
				tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
			}

			if (realOffset >= SEARCH_DISTANCE && realOffset < SEARCH_DISTANCE + BLOCK_SIZE) colData0[realOffset - SEARCH_DISTANCE] = refBlockCol;
			colData1[realOffset] = tagBlockCol;
		}
		else
		{
			// Reset two pixels at the same time because it has two write ports.
			resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
			resetCnt++;
			resetPix(resetCnt/(PIXS_PER_COL), (resetCnt % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
			resetCnt++;
		}
	}

	// This loop is used to read the buffers and generate the stream.
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		GenerateStreamLoop:for(int k= 0; k < BLOCK_SIZE; k++)
		{
			pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

			int16_t out[2*SEARCH_DISTANCE + 1];

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = colData0[k].range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = colData1[k + i].range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
			}

			colSADSum(in1, in2, out);

			apUint112_t outputData;

			for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
			{
				outputData.range(16 * l + 15, 16 * l) = out[l];
			}

			outStream.write(outputData);
		}
	}


}


static ap_int<16> lastSumData[2 * SEARCH_DISTANCE + 1];
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastTagColValidCntSumData;
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastrefTagValidCntSumData;
static uint16_t lastSumRefZeroCnt;
// TODO: continue to optimize this function.
void accumulateStream(hls::stream<apUint112_t> &inStream, hls::stream<int16_t> &outStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
#pragma HLS ARRAY_RESHAPE variable=lastSumData complete dim=1
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		accumulateStream_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apUint112_t inData = inStream.read();
			apUint42_t tagColValidCntData = tagColValidCntStream.read();
			apUint42_t refTagValidCntData = refTagValidCntStream.read();
			apUint6_t refZeroCnt = refZeroCntStream.read();

			uint16_t inputData[2 * SEARCH_DISTANCE + 1];
#pragma HLS ARRAY_RESHAPE variable=inputData complete dim=1
			apUint6_t inputTagColValidCntData[2 * SEARCH_DISTANCE + 1];


			if(k == BLOCK_SIZE - 1)
			{
				ap_int<16> tmpData[2 * SEARCH_DISTANCE + 1];

				ap_uint<1> outlierCond;
				ap_uint<1> refValidCond;
				ap_uint<1> tagValidCond;
				ap_uint<1> refTagValidCond;

				lastSumRefZeroCnt += refZeroCnt;

				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] = lastSumData[l] + inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmpLastTagColValidCntSumData = lastTagColValidCntSumData.range(9 * l + 8, 9 * l);
					tmpLastTagColValidCntSumData += tmpInputTagColValidCntData;
					lastTagColValidCntSumData.range(9 * l + 8, 9 * l) = tmpLastTagColValidCntSumData;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmpLastRefTagValidCntSumData = lastrefTagValidCntSumData.range(9 * l + 8, 9 * l);
					tmpLastRefTagValidCntSumData += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumData.range(9 * l + 8, 9 * l) = tmpLastRefTagValidCntSumData;

					refValidCond = (lastSumRefZeroCnt < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					tagValidCond = (tmpLastTagColValidCntSumData < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					refTagValidCond = (tmpLastRefTagValidCntSumData < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;

					outlierCond = refValidCond | tagValidCond | refTagValidCond;

					// Here, we get the block SAD, if the outlier condition of the corresponding block
					// is satisfied, we simply set the block SAD to 0x7fff
					lastSumData[l] = (outlierCond == 1) ? ap_int<16>(0x7fff) : lastSumData[l];
				}

				ap_int<16> outputMinData;
				int8_t index;
				outputMinData = min(lastSumData, &index);
				outStream.write(outputMinData.to_short());
				OF_yStream.write(index);

				// If use reshape directive, then here must use decrease form.
				// if use increase form, then the II is 2 cannot be 1.
				// And lastSumData couldn't be 0.
				// DON'T KNOW WHY. MIGHT BE A BUG.
				for (int l = 2 * SEARCH_DISTANCE; l >= 0; l--)
				{
					lastSumData[l] = 0;
				}
				lastSumRefZeroCnt = 0;
				lastTagColValidCntSumData = 0;
				lastrefTagValidCntSumData = 0;
			}
			else
			{
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] += inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmpLastTagColValidCntSumData = lastTagColValidCntSumData.range(9 * l + 8, 9 * l);
					tmpLastTagColValidCntSumData += tmpInputTagColValidCntData;
					lastTagColValidCntSumData.range(9 * l + 8, 9 * l) = tmpLastTagColValidCntSumData;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmpLastRefTagValidCntSumData = lastrefTagValidCntSumData.range(9 * l + 8, 9 * l);
					tmpLastRefTagValidCntSumData += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumData.range(9 * l + 8, 9 * l) = tmpLastRefTagValidCntSumData;
				}
				lastSumRefZeroCnt += refZeroCnt;
			}
		}
	}

}

static ap_int<16> lastSumDataScale1[2 * SEARCH_DISTANCE + 1];
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastTagColValidCntSumDataScale1;
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastrefTagValidCntSumDataScale1;
static uint16_t lastSumRefZeroCntScale1;
// TODO: continue to optimize this function.
void accumulateStreamScale1(hls::stream<apUint112_t> &inStream, hls::stream<int16_t> &outStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
#pragma HLS ARRAY_RESHAPE variable=lastSumDataScale1 complete dim=1
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		accumulateStream_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apUint112_t inData = inStream.read();
			apUint42_t tagColValidCntData = tagColValidCntStream.read();
			apUint42_t refTagValidCntData = refTagValidCntStream.read();
			apUint6_t refZeroCnt = refZeroCntStream.read();

			uint16_t inputData[2 * SEARCH_DISTANCE + 1];
#pragma HLS ARRAY_RESHAPE variable=inputData complete dim=1
			apUint6_t inputTagColValidCntData[2 * SEARCH_DISTANCE + 1];


			if(k == BLOCK_SIZE - 1)
			{
				ap_int<16> tmpData[2 * SEARCH_DISTANCE + 1];

				ap_uint<1> outlierCond;
				ap_uint<1> refValidCond;
				ap_uint<1> tagValidCond;
				ap_uint<1> refTagValidCond;

				lastSumRefZeroCntScale1 += refZeroCnt;

				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumDataScale1[l] = lastSumDataScale1[l] + inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastTagColValidCntSumDataScale1 = lastTagColValidCntSumDataScale1.range(9 * l + 8, 9 * l);
					tmplastTagColValidCntSumDataScale1 += tmpInputTagColValidCntData;
					lastTagColValidCntSumDataScale1.range(9 * l + 8, 9 * l) = tmplastTagColValidCntSumDataScale1;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastrefTagValidCntSumDataScale1 = lastrefTagValidCntSumDataScale1.range(9 * l + 8, 9 * l);
					tmplastrefTagValidCntSumDataScale1 += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumDataScale1.range(9 * l + 8, 9 * l) = tmplastrefTagValidCntSumDataScale1;

					refValidCond = (lastSumRefZeroCntScale1 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					tagValidCond = (tmplastTagColValidCntSumDataScale1 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					refTagValidCond = (tmplastrefTagValidCntSumDataScale1 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;

					outlierCond = refValidCond | tagValidCond | refTagValidCond;

					// Here, we get the block SAD, if the outlier condition of the corresponding block
					// is satisfied, we simply set the block SAD to 0x7fff
					lastSumDataScale1[l] = (outlierCond == 1) ? ap_int<16>(0x7fff) : lastSumDataScale1[l];
				}

				ap_int<16> outputMinData;
				int8_t index;
				outputMinData = min(lastSumDataScale1, &index);
				outStream.write(outputMinData.to_short());
				OF_yStream.write(index);

				// If use reshape directive, then here must use decrease form.
				// if use increase form, then the II is 2 cannot be 1.
				// And lastSumDataScale1 couldn't be 0.
				// DON'T KNOW WHY. MIGHT BE A BUG.
				for (int l = 2 * SEARCH_DISTANCE; l >= 0; l--)
				{
					lastSumDataScale1[l] = 0;
				}
				lastSumRefZeroCntScale1 = 0;
				lastTagColValidCntSumDataScale1 = 0;
				lastrefTagValidCntSumDataScale1 = 0;
			}
			else
			{
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumDataScale1[l] += inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastTagColValidCntSumDataScale1 = lastTagColValidCntSumDataScale1.range(9 * l + 8, 9 * l);
					tmplastTagColValidCntSumDataScale1 += tmpInputTagColValidCntData;
					lastTagColValidCntSumDataScale1.range(9 * l + 8, 9 * l) = tmplastTagColValidCntSumDataScale1;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastrefTagValidCntSumDataScale1 = lastrefTagValidCntSumDataScale1.range(9 * l + 8, 9 * l);
					tmplastrefTagValidCntSumDataScale1 += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumDataScale1.range(9 * l + 8, 9 * l) = tmplastrefTagValidCntSumDataScale1;
				}
				lastSumRefZeroCntScale1 += refZeroCnt;
			}
		}
	}

}

static ap_int<16> lastSumDataScale2[2 * SEARCH_DISTANCE + 1];
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastTagColValidCntSumDataScale2;
static ap_uint< 9 * (2 * SEARCH_DISTANCE + 1) > lastrefTagValidCntSumDataScale2;
static uint16_t lastSumRefZeroCntScale2;
// TODO: continue to optimize this function.
void accumulateStreamScale2(hls::stream<apUint112_t> &inStream, hls::stream<int16_t> &outStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint6_t> &refZeroCntStream,
		hls::stream<apUint42_t> &tagColValidCntStream,
		hls::stream<apUint42_t> &refTagValidCntStream)
{
#pragma HLS ARRAY_RESHAPE variable=lastSumDataScale2 complete dim=1
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		accumulateStream_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apUint112_t inData = inStream.read();
			apUint42_t tagColValidCntData = tagColValidCntStream.read();
			apUint42_t refTagValidCntData = refTagValidCntStream.read();
			apUint6_t refZeroCnt = refZeroCntStream.read();

			uint16_t inputData[2 * SEARCH_DISTANCE + 1];
#pragma HLS ARRAY_RESHAPE variable=inputData complete dim=1
			apUint6_t inputTagColValidCntData[2 * SEARCH_DISTANCE + 1];


			if(k == BLOCK_SIZE - 1)
			{
				ap_int<16> tmpData[2 * SEARCH_DISTANCE + 1];

				ap_uint<1> outlierCond;
				ap_uint<1> refValidCond;
				ap_uint<1> tagValidCond;
				ap_uint<1> refTagValidCond;

				lastSumRefZeroCntScale2 += refZeroCnt;

				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumDataScale2[l] = lastSumDataScale2[l] + inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastTagColValidCntSumDataScale2 = lastTagColValidCntSumDataScale2.range(9 * l + 8, 9 * l);
					tmplastTagColValidCntSumDataScale2 += tmpInputTagColValidCntData;
					lastTagColValidCntSumDataScale2.range(9 * l + 8, 9 * l) = tmplastTagColValidCntSumDataScale2;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastrefTagValidCntSumDataScale2 = lastrefTagValidCntSumDataScale2.range(9 * l + 8, 9 * l);
					tmplastrefTagValidCntSumDataScale2 += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumDataScale2.range(9 * l + 8, 9 * l) = tmplastrefTagValidCntSumDataScale2;

					refValidCond = (lastSumRefZeroCntScale2 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					tagValidCond = (tmplastTagColValidCntSumDataScale2 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;
					refTagValidCond = (tmplastrefTagValidCntSumDataScale2 < 2) ? 1 : 0;      // int(0.02 * (BLOCK_SIZE * BLOCK_SIZE)) = 2;

					outlierCond = refValidCond | tagValidCond | refTagValidCond;

					// Here, we get the block SAD, if the outlier condition of the corresponding block
					// is satisfied, we simply set the block SAD to 0x7fff
					lastSumDataScale2[l] = (outlierCond == 1) ? ap_int<16>(0x7fff) : lastSumDataScale2[l];
				}

				ap_int<16> outputMinData;
				int8_t index;
				outputMinData = min(lastSumDataScale2, &index);
				outStream.write(outputMinData.to_short());
				OF_yStream.write(index);

				// If use reshape directive, then here must use decrease form.
				// if use increase form, then the II is 2 cannot be 1.
				// And lastSumDataScale2 couldn't be 0.
				// DON'T KNOW WHY. MIGHT BE A BUG.
				for (int l = 2 * SEARCH_DISTANCE; l >= 0; l--)
				{
					lastSumDataScale2[l] = 0;
				}
				lastSumRefZeroCntScale2 = 0;
				lastTagColValidCntSumDataScale2 = 0;
				lastrefTagValidCntSumDataScale2 = 0;
			}
			else
			{
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumDataScale2[l] += inputData[l];

					apUint6_t tmpInputTagColValidCntData = tagColValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastTagColValidCntSumDataScale2 = lastTagColValidCntSumDataScale2.range(9 * l + 8, 9 * l);
					tmplastTagColValidCntSumDataScale2 += tmpInputTagColValidCntData;
					lastTagColValidCntSumDataScale2.range(9 * l + 8, 9 * l) = tmplastTagColValidCntSumDataScale2;

					apUint6_t tmpInputRefTagValidCntData = refTagValidCntData.range(6 * l + 5, 6 * l);
					ap_uint<9> tmplastrefTagValidCntSumDataScale2 = lastrefTagValidCntSumDataScale2.range(9 * l + 8, 9 * l);
					tmplastrefTagValidCntSumDataScale2 += tmpInputRefTagValidCntData;
					lastrefTagValidCntSumDataScale2.range(9 * l + 8, 9 * l) = tmplastrefTagValidCntSumDataScale2;
				}
				lastSumRefZeroCntScale2 += refZeroCnt;
			}
		}
	}

}



static apUint15_t currentMin = 0x7fff;
void findStreamMin(hls::stream<int16_t> &inStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint15_t> &minStream,  hls::stream<apUint6_t> &OFStream)
{
	apUint6_t OFRet = 0x3f;

	findStreamMin_label4:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		int16_t inData = inStream.read();

		ap_uint<3> tmpOF_y = ap_uint<3>(OF_yStream.read());
		ap_uint<1> compCond;


		if(i == 2 * SEARCH_DISTANCE)
		{
			compCond = (inData < currentMin) ? 1 : 0;

			currentMin = (compCond == 1) ? apUint15_t(inData) : currentMin;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;

			minStream.write(currentMin);
			OFStream.write(OFRet);
			currentMin = 0x7fff;
		}
		else
		{
			compCond = (inData < currentMin) ? 1 : 0;

			currentMin = (compCond == 1) ? apUint15_t(inData) : currentMin;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;
		}
	}
}


static apUint15_t currentMinScale1 = 0x7fff;
void findStreamMinScale1(hls::stream<int16_t> &inStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint15_t> &minStream,  hls::stream<apUint6_t> &OFStream)
{
	apUint6_t OFRet = 0x3f;

	findStreamMin_label4:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		int16_t inData = inStream.read();

		ap_uint<3> tmpOF_y = ap_uint<3>(OF_yStream.read());
		ap_uint<1> compCond;


		if(i == 2 * SEARCH_DISTANCE)
		{
			compCond = (inData < currentMinScale1) ? 1 : 0;

			currentMinScale1 = (compCond == 1) ? apUint15_t(inData) : currentMinScale1;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;

			minStream.write(currentMinScale1);
			OFStream.write(OFRet);
			currentMinScale1 = 0x7fff;
		}
		else
		{
			compCond = (inData < currentMinScale1) ? 1 : 0;

			currentMinScale1 = (compCond == 1) ? apUint15_t(inData) : currentMinScale1;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;
		}
	}
}

static apUint15_t currentMinScale2 = 0x7fff;
void findStreamMinScale2(hls::stream<int16_t> &inStream, hls::stream<int8_t> &OF_yStream,
		hls::stream<apUint15_t> &minStream,  hls::stream<apUint6_t> &OFStream)
{
	apUint6_t OFRet = 0x3f;

	findStreamMin_label4:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		int16_t inData = inStream.read();

		ap_uint<3> tmpOF_y = ap_uint<3>(OF_yStream.read());
		ap_uint<1> compCond;


		if(i == 2 * SEARCH_DISTANCE)
		{
			compCond = (inData < currentMinScale2) ? 1 : 0;

			currentMinScale2 = (compCond == 1) ? apUint15_t(inData) : currentMinScale2;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;

			minStream.write(currentMinScale2);
			OFStream.write(OFRet);
			currentMinScale2 = 0x7fff;
		}
		else
		{
			compCond = (inData < currentMinScale2) ? 1 : 0;

			currentMinScale2 = (compCond == 1) ? apUint15_t(inData) : currentMinScale2;
			OFRet = (compCond == 1) ? tmpOF_y.concat(ap_uint<3>(i)) : OFRet;
		}
	}
}


static uint16_t OFRetRegs[8][8]; // Increase the size to power of 2 to save some resources.

void feedback(apUint15_t miniSumRet, apUint6_t OFRet, apUint1_t rotateFlg, uint16_t *thrRet)
{
#pragma HLS RESOURCE variable=OFRetRegs core=RAM_2P_LUTRAM
    if(miniSumRet <= 0x1ff && miniSumRet > 0 && OFRet != 0x3f)
    {
        uint16_t OFRetHistCnt = OFRetRegs[OFRet.range(2, 0)][OFRet.range(5, 3)];
        OFRetHistCnt = OFRetHistCnt + 1;
        OFRetRegs[OFRet.range(2, 0)][OFRet.range(5, 3)] = OFRetHistCnt;
    }

	if(rotateFlg)
	{
		ap_uint<16> countSum = 0;
		ap_uint<16> histCountSum = 0;
		ap_uint<16> radiusSum =  0;
		ap_uint<16> radiusCountSum =  0;

		feedbackReadOFLoop:for(int8_t OFRetHistX = -SEARCH_DISTANCE; OFRetHistX <= SEARCH_DISTANCE; OFRetHistX++)
		{
			feedbackReadOFInnerLoop:for(int8_t OFRetHistY = -SEARCH_DISTANCE; OFRetHistY <= SEARCH_DISTANCE; OFRetHistY++)
			{

#pragma HLS PIPELINE
				ap_uint<16> count = OFRetRegs[OFRetHistX+SEARCH_DISTANCE][OFRetHistY+SEARCH_DISTANCE];
				ap_uint<16> tmpRadius = OFRetHistX * OFRetHistX + OFRetHistY *  OFRetHistY;
				ap_uint<16> radius = tmpRadius;
				countSum += count;
				radiusCountSum += radius * count;

				histCountSum += 1;
				radiusSum += radius;

				// Clear OF histgram
				OFRetRegs[OFRetHistX+SEARCH_DISTANCE][OFRetHistY+SEARCH_DISTANCE] = 0;
			}
		}

		if (countSum >= 10)
		{
			uint32_t avgMatchMul =  radiusCountSum * histCountSum;
			uint32_t avgTargetMul = radiusSum * countSum;

			// 3/64 = 0.046875~ 0.05
			uint16_t deltaThr = areaEventThr * 3 / 64;
			if(avgMatchMul > avgTargetMul )
			{
//				areaEventThr -= deltaThr;
				if (areaEventThr <= 100)
				{
					areaEventThr = 100;
				}
//            	areaEventThr -= 50;
				std::cout << "AreaEventThr is decreased. New areaEventThr from HW is: " << areaEventThr << std::endl;
			}
			else if (avgMatchMul < avgTargetMul)
			{
//				areaEventThr += deltaThr;
				if (areaEventThr >= 1000)
				{
					areaEventThr = 1000;
				}
//            	areaEventThr += 50;
				std::cout << "AreaEventThr is increased. New areaEventThr from HW is: " << areaEventThr << std::endl;
			}
		}
	}

	areaEventThrBak = areaEventThr;
    *thrRet = areaEventThr;
}

void feedbackWrapperAndOutputResult(hls::stream<apUint15_t> &miniSumStreamScale0, hls::stream<apUint6_t> &OFRetStreamScale0,
		hls::stream<apUint15_t> &miniSumStreamScale1, hls::stream<apUint6_t> &OFRetStreamScale1,
		hls::stream<apUint15_t> &miniSumStreamScale2, hls::stream<apUint6_t> &OFRetStreamScale2,
						hls::stream<apUint17_t> &packetEventDataStream,
					 hls::stream<uint16_t> &thrStream, uint32_t *eventSlice)
{
	apUint17_t tmp1 = packetEventDataStream.read();

	apUint15_t tmpMiniSumRetScale0 = miniSumStreamScale0.read();
	apUint6_t tmpOFScale0 = OFRetStreamScale0.read();

	apUint15_t tmpMiniSumRetScale1 = miniSumStreamScale1.read();
	apUint6_t tmpOFScale1 = OFRetStreamScale1.read();

	apUint15_t tmpMiniSumRetScale2 = miniSumStreamScale2.read();
	apUint6_t tmpOFScale2 = OFRetStreamScale2.read();

	ap_int<16> miniRet;
	ap_uint<6> OFRet;
	ap_uint<2> scaleRet;

    if(tmpOFScale0 != 0x3f) tmpMiniSumRetScale0 = (tmpMiniSumRetScale0 << 4);
    if(tmpOFScale1 != 0x3f) tmpMiniSumRetScale1 = (tmpMiniSumRetScale1 << 2);
    miniRet = tmpMiniSumRetScale2;
    OFRet = tmpOFScale2;
    scaleRet = 2;
    if(tmpMiniSumRetScale1 < miniRet)
    {
        miniRet = tmpMiniSumRetScale1;
        OFRet = tmpOFScale1;
        scaleRet = 1;
    }
    if(tmpMiniSumRetScale0 < miniRet)
    {
        miniRet = tmpMiniSumRetScale0;
        OFRet = tmpOFScale0;
        scaleRet = 0;
    }

//	apUint1_t tmpFlg = rotateFlgStream.read();

	uint16_t tmpThr;

	ap_int<9> tmp2 = miniRet.range(8, 0);
	apUint6_t tmpOF = OFRet;

	feedback(miniRet, tmpOF, glRotateFlg, &tmpThr);

	thrStream.write(tmpThr);

	ap_uint<32> output = (deltaTsHW, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
	*eventSlice++ = output.to_uint();
}

void outputResult(hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream,  hls::stream<apUint17_t> &packetEventDataStream, int32_t *eventSlice)
{
//	outputLoop: for(int32_t i = 0; i < eventIterSize; i++)
//	{
		apUint17_t tmp1 = packetEventDataStream.read();
		apUint15_t miniSumRet = miniSumStream.read();
		ap_int<9> tmp2 = miniSumRet.range(8, 0);
		apUint6_t tmpOF = OFRetStream.read();

		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
		*eventSlice++ = output.to_int();

//	}
}

void testSingleRwslicesHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePix(x, y, idx);
	readBlockCols(x, y, idx + 1, idx + 2, refCol, tagCol);
	resetPix(x, y, idx + 3);
}

void testRwslices(uint64_t * data, sliceIdx_t idx, int16_t eventCnt,
			  apIntBlockCol_t *refData, apIntBlockCol_t *tagData)
{
	hls::stream<uint8_t>  xStream("xStream"), yStream("yStream");
	hls::stream<sliceIdx_t> idxStream("idxStream");
	hls::stream<apUint17_t> pktEventDataStream("EventStream");
	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
	hls::stream<apIntBlockCol_t> refStreamScale1("refStreamScale1"), tagStreamInScale1("tagStreamScale1");
	hls::stream<apIntBlockCol_t> refStreamScale2("refStreamScale2"), tagStreamInScale2("tagStreamScale2");

	eventIterSize = eventCnt;

	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
		uint64_t tmp = data[i];
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		xStream << xWr;
		yStream << yWr;
		idxStream << idx;
	}

	rwSlices(xStream, yStream, idxStream, refStream, tagStreamIn, refStreamScale1, tagStreamInScale1, refStreamScale2, tagStreamInScale2);

	writeFromStream: for(int32_t i = 0; i < eventIterSize * (BLOCK_SIZE + 2 * SEARCH_DISTANCE); i++)
	{
		refStream >> *refData++;
		tagStreamIn >> *tagData++;
	}

}

#pragma SDS data access_pattern(data:SEQUENTIAL, eventSlice:SEQUENTIAL)
// #pragma SDS data data_mover(data:AXIFIFO:1, eventSlice:AXIFIFO:2)
// #pragma SDS data buffer_depth(data:512, eventSlice:1)
#pragma SDS data data_mover(data:AXIDMA_SIMPLE:1, eventSlice:AXIDMA_SIMPLE:2)
#pragma SDS data copy(data[0:eventsArraySize], eventSlice[0:eventsArraySize])
#pragma SDS data mem_attribute(data:PHYSICAL_CONTIGUOUS, eventSlice:PHYSICAL_CONTIGUOUS)
// #pragma SDS data zero_copy(eventSlice[0:DVS_WIDTH * DVS_HEIGHT])
//#pragma SDS data sys_port(data:AFI, eventSlice:AFI)
void parseEvents(const uint64_t * data, int32_t eventsArraySize, uint32_t *eventSlice, ap_uint<1> *outLed)
{
//#pragma HLS INTERFACE axis port=data
//#pragma HLS INTERFACE axis register both port=eventSlice

//#pragma HLS INTERFACE m_axi port=eventSlice offset=slave bundle=gmem max_read_burst_length=2 max_write_burst_length=256

//#pragma HLS INTERFACE s_axilite port=return bundle=control
	hls::stream<uint8_t>  xInStream("xInStream"), yInStream("yInStream");
	hls::stream<uint8_t>  xOutStream("xOutStream"), yOutStream("yOutStream");
	hls::stream<uint32_t>  tsInStream("tsInStream");

	hls::stream<sliceIdx_t> idxStream("idxStream");
	hls::stream<apUint17_t> pktEventDataStream("EventStream");
#pragma HLS STREAM variable=pktEventDataStream depth=2 dim=1
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL

	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
#pragma HLS STREAM variable=refStream depth=2 dim=1
#pragma HLS RESOURCE variable=refStream core=FIFO_SRL
#pragma HLS STREAM variable=tagStreamIn depth=6 dim=1
#pragma HLS RESOURCE variable=tagStreamIn core=FIFO_SRL
	hls::stream<apIntBlockCol_t> refStreamScale1("refStreamScale1"), tagStreamInScale1("tagStreamScale1");
#pragma HLS STREAM variable=tagStreamInScale1 depth=6 dim=1
#pragma HLS STREAM variable=refStreamScale1 depth=2 dim=1
	hls::stream<apIntBlockCol_t> refStreamScale2("refStreamScale2"), tagStreamInScale2("tagStreamScale2");
#pragma HLS STREAM variable=tagStreamInScale2 depth=6 dim=1
#pragma HLS STREAM variable=refStreamScale2 depth=2 dim=1

	hls::stream<apUint15_t> miniSumStreamScale0("miniSumStreamScale0"), miniSumStreamScale1("miniSumStreamScale1"), miniSumStreamScale2("miniSumStreamScale2");
#pragma HLS STREAM variable=miniSumStreamScale0 depth=2 dim=1
#pragma HLS RESOURCE variable=miniSumStreamScale0 core=FIFO_SRL
#pragma HLS STREAM variable=miniSumStreamScale1 depth=2 dim=1
#pragma HLS RESOURCE variable=miniSumStreamScale1 core=FIFO_SRL
#pragma HLS STREAM variable=miniSumStreamScale2 depth=2 dim=1
#pragma HLS RESOURCE variable=miniSumStreamScale2 core=FIFO_SRL
	hls::stream<apUint6_t> OFRetStreamScale0("OFRetStreamScale0"), OFRetStreamScale1("OFRetStreamScale1"), OFRetStreamScale2("OFRetStreamScale2");

	hls::stream<uint16_t> thrStream("thresholdStream");
#pragma HLS STREAM variable=thrStream depth=3 dim=1
	hls::stream<apUint1_t> rotatFlgStream("rotationFlgStream");

	hls::stream<uint8_t>  xWrStream("xWrStream"), yWrStream("yWrStream");
	hls::stream<sliceIdx_t> idxWrStream("idxWrStream");
	hls::stream<col_pix_t> currentColStream("currentColStream");

	hls::stream<apUint112_t> outStream("sumStream"), outStreamScale1("outStreamScale1"), outStreamScale2("outStreamScale2");
#pragma HLS STREAM variable=outStream depth=2 dim=1
#pragma HLS RESOURCE variable=outStream core=FIFO_SRL
#pragma HLS STREAM variable=outStreamScale1 depth=2 dim=1
#pragma HLS RESOURCE variable=outStreamScale1 core=FIFO_SRL
#pragma HLS STREAM variable=outStreamScale2 depth=2 dim=1
#pragma HLS RESOURCE variable=outStreamScale2 core=FIFO_SRL
	hls::stream<int16_t> outSumStream("outSumStream"), outSumStreamScale1("outSumStreamScale1"), outSumStreamScale2("outSumStreamScale2");
	hls::stream<int8_t> OF_yStream("OF_yStream"), OF_yStreamScale1("OF_yStreamScale1"), OF_yStreamScale2("OF_yStreamScale2");

	hls::stream<apUint6_t> refZeroCntStream("refZeroCntStream"), refZeroCntStreamScale1("refZeroCntStreamScale1"), refZeroCntStreamScale2("refZeroCntStreamScale2");
#pragma HLS STREAM variable=refZeroCntStream depth=2 dim=1
#pragma HLS STREAM variable=refZeroCntStreamScale1 depth=2 dim=1
#pragma HLS STREAM variable=refZeroCntStreamScale2 depth=2 dim=1
	hls::stream<uint16_t> refZeroCntSumStream("refZeroCntSumStream"),
						  refZeroCntSumStreamScale1("refZeroCntSumStreamScale1"),
						  refZeroCntSumStreamScale2("refZeroCntSumStreamScale2");

	hls::stream<apUint42_t> tagColValidCntStream("tagColValidCntStream"), tagColValidCntStreamScale1("tagColValidCntStreamScale1"), tagColValidCntStreamScale2("tagColValidCntStreamScale2");
#pragma HLS STREAM variable=tagColValidCntStream depth=2 dim=1
#pragma HLS STREAM variable=tagColValidCntStreamScale1 depth=2 dim=1
#pragma HLS STREAM variable=tagColValidCntStreamScale2 depth=2 dim=1
	hls::stream<uint16_t> tagColValidCntSumStream("tagColValidCntSumStream"),
						  tagColValidCntSumStreamScale1("tagColValidCntSumStreamScale1"),
						  tagColValidCntSumStreamScale2("tagColValidCntSumStreamScale2");

	hls::stream<apUint42_t> refTagValidCntStream("refTagValidCntStream"), refTagValidCntStreamScale1("refTagValidCntStreamScale1"), refTagValidCntStreamScale2("refTagValidCntStreamScale2");
#pragma HLS STREAM variable=refTagValidCntStream depth=2 dim=1
#pragma HLS STREAM variable=refTagValidCntStreamScale1 depth=2 dim=1
#pragma HLS STREAM variable=refTagValidCntStreamScale2 depth=2 dim=1
	hls::stream<uint16_t> refTagValidCntSumStream("tagColValidCntSumStream"),
						  refTagValidCntSumStreamScale1("refTagValidCntSumStreamScale1"),
						  refTagValidCntSumStreamScale2("refTagValidCntSumStreamScale2");

	eventIterSize = eventsArraySize;

	parseEventsLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		DFRegion:
		{
#pragma HLS DATAFLOW

			// This one has wrong block sad sum module.
//			getXandY(dataStream++, xInStream, yInStream, pktEventDataStream);
//			rotateSlice(xInStream, yInStream, xOutStream, yOutStream, idxStream);
//			rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
//			miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
//			outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice++);

//			getXandY(dataStream++, xInStream, yInStream, pktEventDataStream);
//			rotateSliceNoRotationFlg(xInStream, yInStream, xOutStream, yOutStream, idxStream);
//			rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
//			colStreamToColSum(refStream, tagStreamIn, outStream);
//			accumulateStream(outStream, outSumStream, OF_yStream);
//			findStreamMin(outSumStream, OF_yStream, miniSumStream, OFRetStream);
//			outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice++);

			// With feedback
			getXandY(data++, xInStream, yInStream, tsInStream, pktEventDataStream);
			rotateSlice(xInStream, yInStream, tsInStream, thrStream, xOutStream, yOutStream, idxStream);
			rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn, refStreamScale1, tagStreamInScale1, refStreamScale2, tagStreamInScale2);

			colStreamToColSum(refStream, tagStreamIn, outStream, refZeroCntStream, tagColValidCntStream, refTagValidCntStream);
			accumulateStream(outStream, outSumStream, OF_yStream, refZeroCntStream, tagColValidCntStream,  refTagValidCntStream);
			findStreamMin(outSumStream, OF_yStream, miniSumStreamScale0, OFRetStreamScale0);

			colStreamToColSumScale1(refStreamScale1, tagStreamInScale1, outStreamScale1, refZeroCntStreamScale1, tagColValidCntStreamScale1, refTagValidCntStreamScale1);
			accumulateStreamScale1(outStreamScale1, outSumStreamScale1, OF_yStreamScale1, refZeroCntStreamScale1, tagColValidCntStreamScale1,  refTagValidCntStreamScale1);
			findStreamMinScale1(outSumStreamScale1, OF_yStreamScale1, miniSumStreamScale1, OFRetStreamScale1);

			colStreamToColSumScale2(refStreamScale2, tagStreamInScale2, outStreamScale2, refZeroCntStreamScale2, tagColValidCntStreamScale2, refTagValidCntStreamScale2);
			accumulateStreamScale2(outStreamScale2, outSumStreamScale2, OF_yStreamScale2, refZeroCntStreamScale2, tagColValidCntStreamScale2,  refTagValidCntStreamScale2);
			findStreamMinScale2(outSumStreamScale2, OF_yStreamScale2, miniSumStreamScale2, OFRetStreamScale2);

			feedbackWrapperAndOutputResult(miniSumStreamScale0, OFRetStreamScale0,
									       miniSumStreamScale1, OFRetStreamScale1,
										   miniSumStreamScale2, OFRetStreamScale2,
										   pktEventDataStream, thrStream, eventSlice++);

			// This is the version combined rwSlices and colStreamToColSum together
			// It consumes less resources but has higher II.
//			getXandY(dataStream++, xInStream, yInStream, pktEventDataStream);
//			rotateSlice(xInStream, yInStream, xOutStream, yOutStream, idxStream);
//			rwSlicesAndColStreams(xOutStream, yOutStream, idxStream, outStream);
//			accumulateStream(outStream, outSumStream, OF_yStream);
//			findStreamMin(outSumStream, OF_yStream, miniSumStream, OFRetStream);
//			outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice++);

// read and write array in separate process function is not supported in dataflow.
//			getXandY(dataStream++, xInStream, yInStream, pktEventDataStream);
//			rotateSlice(xInStream, yInStream, xOutStream, yOutStream, idxStream);
//			readSlices( xOutStream, yOutStream, idxStream, xWrStream, yWrStream, idxWrStream,currentColStream, refStream, tagStreamIn);
//			writeSlices(xWrStream, yWrStream, idxWrStream, currentColStream);
//			miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
//			outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice++);

//			getXandY(dataStream, xInStream, yInStream, pktEventDataStream);
//			rotateSlice(xInStream, yInStream, thrStream, xOutStream, yOutStream, idxStream, rotatFlgStream);
//			rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
//			miniSADSumWrapper(refStream, tagStreamIn, miniSumStream, OFRetStream);
//			feedbackWrapperAndOutputResult(miniSumStream, OFRetStream, pktEventDataStream, rotatFlgStream, thrStream, eventSlice);
		}
	}
}
