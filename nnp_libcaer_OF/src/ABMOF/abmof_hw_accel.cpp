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
#pragma HLS ARRAY_RESHAPE variable=inArr complete dim=1
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


void getXandY(const uint64_t * data, hls::stream<uint8_t>  &xStream, hls::stream<uint8_t> &yStream, hls::stream<apUint17_t> &packetEventDataStream)
//void getXandY(const uint64_t * data, int32_t eventsArraySize, ap_uint<8> *xStream, ap_uint<8> *yStream)
{
#pragma HLS INLINE off

	// Every event always consists of 2 int32_t which is 8bytes.
//	getXandYLoop:for(int32_t i = 0; i < eventIterSize; i++)
//	{
		uint64_t tmp = *data;
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
//	}
}

static uint16_t areaEventRegs[AREA_NUMBER][AREA_NUMBER];
static uint16_t areaEventThr = 20;

apUint1_t glRotateFlg = 0;
// areaEventThr is occupied by feedback, here we use another value to copy its initial value.
// Remember to update this value when areaEventThr is updated.
uint16_t areaEventThrBak = areaEventThr;

void rotateSlice(hls::stream<uint8_t>  &xInStream, hls::stream<uint8_t> &yInStream, hls::stream<uint16_t> &thrStream,
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

	uint16_t c = areaEventRegs[x/AREA_SIZE][y/AREA_SIZE];
	c = c + 1;
	areaEventRegs[x/AREA_SIZE][y/AREA_SIZE] = c;

	uint16_t tmpThr = 60;

	if (!thrStream.empty()) tmpThr = thrStream.read();

	glRotateFlg = 0;
	// The area threshold reached, rotate the slice index and clear the areaEventRegs.
	if (c > tmpThr)
	{
		glPLActiveSliceIdx--;
		glRotateFlg = 1;

		for(int r = 0; r < 1; r++)
		{
			std::cout << "Rotated successfully from HW!!!!" << std::endl;
			std::cout << "x is: " << x << "\t y is: " << y << "\t idx is: " << glPLActiveSliceIdx << std::endl;
		}


		rotateSliceResetLoop:for(int areaX = 0; areaX < AREA_NUMBER; areaX++)
		{
#pragma HLS INLINE off
#pragma HLS PIPELINE
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



// It takes 2048 cycles to reset the whole slice, so we use 11 bits.
static ap_uint<11> resetCnt;
sliceIdx_t oldIdx = glPLActiveSliceIdx;
void rwSlices(hls::stream<uint8_t> &xStream, hls::stream<uint8_t> &yStream, hls::stream<sliceIdx_t> &idxStream,
			  hls::stream<apIntBlockCol_t> &refStreamOut, hls::stream<apIntBlockCol_t> &tagStreamOut)
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

				readBlockCols(xRd - BLOCK_SIZE/2 - SEARCH_DISTANCE + xOffSet - 1, yRd , idx + 1, idx + 2, out1, out2);

				apIntBlockCol_t refBlockCol;
				apIntBlockCol_t tagBlockCol;

				for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
				{
					refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
					tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
				}

				if (xOffSet > SEARCH_DISTANCE && xOffSet <= SEARCH_DISTANCE + BLOCK_SIZE) refStreamOut << refBlockCol;
				tagStreamOut << tagBlockCol;
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
		hls::stream<apUint112_t> &outStream)
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

			// This forloop should be unrolled completely, otherwise it will take a lot of shift registers
			// to calculate the range function. However, unroll it completely will make all this operations
			// are only wires connection and will not consume any resources.
			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				in1[l] = tmpData0.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
				in2[l] = tmpData1.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l);
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
void accumulateStream(hls::stream<apUint112_t> &inStream, hls::stream<int16_t> &outStream, hls::stream<int8_t> &OF_xStream)
{
#pragma HLS ARRAY_RESHAPE variable=lastSumData complete dim=1
	for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		accumulateStream_label3:for(int k= 0; k < BLOCK_SIZE; k++)
		{
#pragma HLS PIPELINE rewind
			apUint112_t inData = inStream.read();

			uint16_t inputData[2 * SEARCH_DISTANCE + 1];
#pragma HLS ARRAY_RESHAPE variable=inputData complete dim=1

			if(k == BLOCK_SIZE - 1)
			{
				ap_int<16> tmpData[2 * SEARCH_DISTANCE + 1];
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] = lastSumData[l] + inputData[l];
				}

				ap_int<16> outputMinData;
				int8_t index;
				outputMinData = min(lastSumData, &index);
				outStream.write(outputMinData.to_short());
				OF_xStream.write(index);

				// If use reshape directive, then here must use decrease form.
				// if use increase form, then the II is 2 cannot be 1.
				// And lastSumData couldn't be 0.
				// DON'T KNOW WHY. MIGHT BE A BUG.
				for (int l = 2 * SEARCH_DISTANCE; l >= 0; l--)
				{
					lastSumData[l] = 0;
				}
			}
			else
			{
				for (int l = 0; l < 2 * SEARCH_DISTANCE + 1; l++)
				{
					inputData[l] = inData.range(16 * l + 15, 16 * l);
					lastSumData[l] += inputData[l];
				}
			}
		}
	}

}


static apUint15_t currentMin = 0x7fff;
void findStreamMin(hls::stream<int16_t> &inStream, hls::stream<int8_t> &OF_xStream, hls::stream<apUint15_t> &minStream, hls::stream<apUint6_t> &OFStream)
{
	apUint6_t OFRet = 0x3f;

	findStreamMin_label4:for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
	{
		int16_t inData = inStream.read();
		ap_uint<3> tmpOF_x = ap_uint<3>(OF_xStream.read());
		ap_uint<1> compCond;

		if(i == 2 * SEARCH_DISTANCE)
		{
			compCond = (inData < currentMin) ? 1 : 0;
			currentMin = (compCond == 1) ? apUint15_t(inData) : currentMin;
			OFRet = (compCond == 1) ? ap_uint<3>(i).concat(tmpOF_x) : OFRet;
			minStream.write(currentMin);
			OFStream.write(OFRet);
			currentMin = 0x7fff;
		}
		else
		{
			compCond = (inData < currentMin) ? 1 : 0;
			currentMin = (compCond == 1) ? apUint15_t(inData) : currentMin;
			OFRet = (compCond == 1) ? ap_uint<3>(i).concat(tmpOF_x) : OFRet;
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
				areaEventThr -= deltaThr;
//            	areaEventThr -= 50;
			}
			else if (avgMatchMul < avgTargetMul)
			{
				areaEventThr += deltaThr;
//            	areaEventThr += 50;
			}
		}
	}

	areaEventThrBak = areaEventThr;
    *thrRet = areaEventThr;
}

void feedbackWrapperAndOutputResult(hls::stream<apUint15_t> &miniSumStream, hls::stream<apUint6_t> &OFRetStream,
						hls::stream<apUint17_t> &packetEventDataStream,
					 hls::stream<uint16_t> &thrStream, uint32_t *eventSlice)
{
	apUint17_t tmp1 = packetEventDataStream.read();
	apUint15_t tmpMiniSumRet = miniSumStream.read();
	ap_int<9> tmp2 = tmpMiniSumRet.range(8, 0);
	apUint6_t tmpOF = OFRetStream.read();

//	apUint1_t tmpFlg = rotateFlgStream.read();

	uint16_t tmpThr;

	feedback(tmpMiniSumRet, tmpOF, glRotateFlg, &tmpThr);

	thrStream.write(tmpThr);

	ap_uint<32> output = (tmp2, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
	*eventSlice++ = output.to_uint();
}

static uint16_t eventIterSize = 100;

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
	hls::stream<sliceIdx_t> idxStream("idxStream");
	hls::stream<apUint17_t> pktEventDataStream("EventStream");
	hls::stream<apUint6_t> OFRetStream("OFStream");
	hls::stream<apIntBlockCol_t> refStream("refStream"), tagStreamIn("tagStream");
	hls::stream<apUint15_t> miniSumStream("miniSumStream");

	hls::stream<uint16_t> thrStream("thresholdStream");
#pragma HLS STREAM variable=thrStream depth=3 dim=1
	hls::stream<apUint1_t> rotatFlgStream("rotationFlgStream");

	hls::stream<uint8_t>  xWrStream("xWrStream"), yWrStream("yWrStream");
	hls::stream<sliceIdx_t> idxWrStream("idxWrStream");
	hls::stream<col_pix_t> currentColStream("currentColStream");

	hls::stream<apUint112_t> outStream("sumStream");
#pragma HLS STREAM variable=outStream depth=2 dim=1
#pragma HLS RESOURCE variable=outStream core=FIFO_SRL
	hls::stream<int16_t> outSumStream("outSumStream");
	hls::stream<int8_t> OF_xStream("OF_yStream");

	eventIterSize = eventsArraySize;

	parseEventsLoop:for(int32_t i = 0; i < eventIterSize; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000
		DFRegion:
		{
#pragma HLS DATAFLOW
#pragma HLS STREAM variable=pktEventDataStream depth=2 dim=1
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL
#pragma HLS STREAM variable=miniSumStream depth=2 dim=1
#pragma HLS RESOURCE variable=miniSumStream core=FIFO_SRL
#pragma HLS STREAM variable=tagStreamIn depth=6 dim=1
#pragma HLS RESOURCE variable=tagStreamIn core=FIFO_SRL
#pragma HLS STREAM variable=refStream depth=2 dim=1
#pragma HLS RESOURCE variable=refStream core=FIFO_SRL

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
//			accumulateStream(outStream, outSumStream, OF_xStream);
//			findStreamMin(outSumStream, OF_xStream, miniSumStream, OFRetStream);
//			outputResult(miniSumStream, OFRetStream, pktEventDataStream, eventSlice++);

			// With feedback
			getXandY(data++, xInStream, yInStream, pktEventDataStream);
			rotateSlice(xInStream, yInStream, thrStream, xOutStream, yOutStream, idxStream);
			rwSlices(xOutStream, yOutStream, idxStream, refStream, tagStreamIn);
			colStreamToColSum(refStream, tagStreamIn, outStream);
			accumulateStream(outStream, outSumStream, OF_xStream);
			findStreamMin(outSumStream, OF_xStream, miniSumStream, OFRetStream);
			feedbackWrapperAndOutputResult(miniSumStream, OFRetStream, pktEventDataStream, thrStream, eventSlice++);

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
