#include "abmof_hw_accel.h"
#include "ap_int.h"
#include <iostream>
#include "ap_int.h"
#include "hls_stream.h"
#include "assert.h"

// SAE (Surface of Active Event)
// Some important things about the hardware memory overflow.
// Here for example RESHAPE_FACTOR = 16 is the power of 2.
// Then in this memory saeHW, the address will be 11bits. How can we know that it is 11bits?
// If we represent it as saeHW[0][y][x].
// The address is calculated from y/RESHAPE_FACTOR * (256 - 16) + x.
// y >> 4 will have 3 bits and x have 8 bits. The maximum of y is assumed 128.
// So the real capacity of the memory are 128/16 * 240 = 1920 words.
// Howvere, we have 11bits memory, so it can represent a memory capacity of 2^11 = 2048 words.
// That means, if we try to read words range from 1920 to 2048, it will return XXX;
// But if we try to read words range which is bigger than 2048, it will go back to 2048.
// For example, if y = 128, x = 127, then 128/16 * 240 +  127 = 2047, it will return XXX
// But if y = 128, x = 128, then 128/16 * 128 + 128 = 2048, it will return of value of the 0th word.
// It has observed from the simulation.
// If sotware overflow, the simulation will report scaling mode error.
static col_pix_t saeHW[1][DVS_HEIGHT/RESHAPE_FACTOR][DVS_WIDTH];

//const int innerCircleOffset[INNER_SIZE][2] = {{0, 3}, {1, 3}, {2, 2}, {3, 1},
//      {3, 0}, {3, -1}, {2, -2}, {1, -3},
//      {0, -3}, {-1, -3}, {-2, -2}, {-3, -1},
//      {-3, 0}, {-3, 1}, {-2, 2}, {-1, 3}};
//const int outerCircleOffset[OUTER_SIZE][2] = {{0, 4}, {1, 4}, {2, 3}, {3, 2},
//      {4, 1}, {4, 0}, {4, -1}, {3, -2},
//      {2, -3}, {1, -4}, {0, -4}, {-1, -4},
//      {-2, -3}, {-3, -2}, {-4, -1}, {-4, 0},
//      {-4, 1}, {-3, 2}, {-2, 3}, {-1, 4}};

//const ap_int<128> innerTest =  ap_int<128>("03132231303f2e1d0dfdeedfd0d1e2f3", 16);
//const ap_int<160> outerTest = ap_int<160>("0414233241404f3e2d1c0cfceddecfc0c1d2e3f4", 16);

const ap_int<128> innerTest =  ap_int<128>("3f2e1d0dfdeedfd0d1e2f30313223130", 16);
const ap_int<160> outerTest = ap_int<160>("4f3e2d1c0cfceddecfc0c1d2e3f4041423324140", 16);

static ap_uint<2> glStage = 0;
static ap_uint<2> glStageBak = glStage;

static uint32_t glInitCounter = 0, glFeedbackCounter = 0;

void getXandY(const uint64_t * data, hls::stream<X_TYPE> &xStream, hls::stream<Y_TYPE> &yStream, hls::stream< ap_uint<TS_TYPE_BIT_WIDTH> > &tsStream, hls::stream<apUint17_t> &packetEventDataStream)
{
#pragma HLS PIPELINE
	uint64_t tmp = *data;
	X_TYPE xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
	Y_TYPE yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
	bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
	ap_uint<TS_TYPE_BIT_WIDTH> ts = tmp >> 32;

	xStream << xWr;
	yStream << yWr;
	tsStream << ts;

	xStream << xWr;
	yStream << yWr;
	tsStream << ts;

	packetEventDataStream << apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
}

void initStageStream(hls::stream< ap_uint<2> >  &stageInStream, hls::stream< ap_uint<2> >  &stageOutStream)
{
#pragma HLS INLINE off
	ap_uint<2> stageIn = 0;
	ap_uint<1> isStageCorner = 0;
	// Every event will invoke this module two times, at the first time, we made it always zero, and the second time read from the stream.
	if(glInitCounter%2 == 0)
	{
		stageIn = 0;
	}
    else
    {
        // stageIn = stageInStream.read();
    	stageIn = 1;
    }
	glStage = stageIn;

	// This counter is used to syncronize this module and the feedback module.
	// Make them have the common adder source.
	glFeedbackCounter = glInitCounter;
    glInitCounter++;

	stageOutStream << stageIn;
}

ap_uint<TS_TYPE_BIT_WIDTH> readOneDataFromCol(col_pix_t colData, ap_uint<8> idx)
{
#pragma HLS INLINE
	ap_uint<TS_TYPE_BIT_WIDTH> retData;
	// Use bit selection plus for-loop to read multi-bits from a wider bit width value
	// rather than use range selection directly. The reason is that the latter will use
	// a lot of shift-register which will increase a lot of LUTs consumed.
	readWiderBitsLoop: for(int8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>(idx * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

		retData[yIndex] = colData[colIdx];
//		retData[yIndex] = colData[ap_uint<TS_TYPE_BIT_WIDTH>_BIT_WIDTH*idx + yIndex];
	}
	return retData;
}

void writeOneDataToCol(col_pix_t *colData, ap_uint<8> idx, ap_uint<TS_TYPE_BIT_WIDTH> toWriteData)
{
#pragma HLS INLINE
	writeWiderBitsLoop: for(int8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
	{
#pragma HLS UNROLL
		const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
		ap_uint<8 + bitOffset> colIdx;
		// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
		colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>(idx * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
		colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

		(*colData)[colIdx] = toWriteData[yIndex];
	}
}


void updateSAE(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts)
{
#pragma HLS INLINE
	col_pix_t tmpData;
	Y_TYPE yNewIdx = y%RESHAPE_FACTOR;

	tmpData = saeHW[0][y/RESHAPE_FACTOR][x];

	writeOneDataToCol(&tmpData, yNewIdx, ts);

	saeHW[0][y/RESHAPE_FACTOR][x] = tmpData;
}

template<int READ_NPC>   //  Due to the memory has 2 ports at most for arbitrary reading, here this number could be only 1 or 2.
void rwSAEStream(hls::stream<X_TYPE> &xStream, hls::stream<Y_TYPE> &yStream, hls::stream< ap_uint<TS_TYPE_BIT_WIDTH> > &tsStream, hls::stream< ap_uint<2> >  &stageStream, ap_uint<TS_TYPE_BIT_WIDTH> outputData[OUTER_SIZE], ap_uint<5> *size)
{
//#pragma HLS RESOURCE variable=saeHW core=RAM_T2P_BRAM
#pragma HLS INLINE off
	X_TYPE x = xStream.read();
	Y_TYPE y = yStream.read();
	ap_uint<TS_TYPE_BIT_WIDTH> ts = tsStream.read();

	ap_uint<2> stage = 0;
	stage = stageStream.read();

	if(stage == 0)
	{
//		updateSAE(x, y, ts);

		readInnerCircleFromSAE:for(ap_uint<8> i = 0; i < INNER_SIZE + 1; i = i + READ_NPC)
		{
	#pragma HLS DEPENDENCE variable=saeHW inter false
	#pragma HLS PIPELINE rewind
			if (i >= INNER_SIZE)
			{
				updateSAE(x, y, ts);
			}
			else
			{
	            ap_uint<8 * READ_NPC> xInnerTest, xOuterTest;
	            X_TYPE xInner[READ_NPC];
	            Y_TYPE yInner[READ_NPC], yInnerNewIdx[READ_NPC];
	        	rwSAEReadOffsetBitsLoop:
	            for (ap_uint<8> j = 0; j < 8 * READ_NPC; j++)
	            {
	#pragma HLS UNROLL
	            	ap_uint<8> tmpIndex;   // In  order to save the resource, we use bit operation to get the index of the inner/outer offset.
	            	tmpIndex.range(7, 2 + READ_NPC) = ap_uint<8>(i * 8).range(7, 2 + READ_NPC);
	            	tmpIndex.range(1 + READ_NPC, 0) = j.range(1 + READ_NPC, 0);
	            	xInnerTest[j] = innerTest[tmpIndex];
	            	xOuterTest[j] = outerTest[tmpIndex];
	            }

	            readNPCLoop:
	            for (ap_uint<8> k = 0; k < READ_NPC; k++)
	            {
	                xInner[k] = x + ap_int<4>(xInnerTest(8 * k + 3, 8  * k));  // Change back from unsigned to signed.
	                yInner[k] = y + ap_int<4>(xInnerTest(8 * k + 7, 8 * k + 4));          // Change back from unsigned to signed.
	                yInnerNewIdx[k] = yInner[k]%RESHAPE_FACTOR;

	                outputData[i + k] = readOneDataFromCol(saeHW[0][yInner[k]/RESHAPE_FACTOR][xInner[k]], yInnerNewIdx[k]);
	            }

	//			X_TYPE xOuter = x + xOuterTest(3, 0);
	//			Y_TYPE yOuter = y + xOuterTest(7, 4);
	//			Y_TYPE yOuterNewIdx = yOuter%RESHAPE_FACTOR;
	//
	//			outerCircle[i] = readOneDataFromCol(saeHW[0][yOuter/RESHAPE_FACTOR][xOuter], yOuterNewIdx);
			}
		}

		*size = INNER_SIZE;
	}
	else if(stage == 1)
	{
		readOuterCircleFromSAE:for(ap_uint<8> i = 0; i < OUTER_SIZE; i = i + READ_NPC)
		{
	#pragma HLS DEPENDENCE variable=saeHW inter false
	#pragma HLS PIPELINE rewind
//			if (i >= OUTER_SIZE)
//			{
//				updateSAE(x, y, ts);
//			}
//			else
//			{
				ap_uint<8 * READ_NPC> xOuterTest;
				X_TYPE xOuter[READ_NPC];
				Y_TYPE yOuter[READ_NPC], yOuterNewIdx[READ_NPC];
				rwSAEReadOuterOffsetBitsLoop:
				for (ap_uint<8> j = 0; j < 8 * READ_NPC; j++)
				{
		#pragma HLS UNROLL
					ap_uint<8> tmpIndex; // In  order to save the resource, we use bit operation to get the index of the inner/outer offset.
					tmpIndex.range(7, 2 + READ_NPC) = ap_uint<8>(i * 8).range(7, 2 + READ_NPC);
					tmpIndex.range(1 + READ_NPC, 0) = j.range(1 + READ_NPC, 0);
					xOuterTest[j] = outerTest[tmpIndex];
				}

				readOuterNPCLoop:
				for (ap_uint<8> k = 0; k < READ_NPC; k++)
				{
					xOuter[k] = x + ap_int<4>(xOuterTest(8 * k + 3, 8  * k));       // Change back from unsigned to signed.
					yOuter[k] = y + ap_int<4>(xOuterTest(8 * k + 7, 8 * k + 4));    // Change back from unsigned to signed.
					yOuterNewIdx[k] = yOuter[k]%RESHAPE_FACTOR;

					outputData[i + k] = readOneDataFromCol(saeHW[0][yOuter[k]/RESHAPE_FACTOR][xOuter[k]], yOuterNewIdx[k]);
				}
//			}
		}
		*size = OUTER_SIZE;
	}
	else
	{
		*size = 0;
	}
}


// Function Description: convert ap_memory to several ap_none ports
template<int NPC>
void convertInterface(ap_uint<TS_TYPE_BIT_WIDTH> inData[OUTER_SIZE], ap_uint<5> size, hls::stream< ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> > &inStream)
{
#pragma HLS ARRAY_PARTITION variable=inData cyclic factor=NPC dim=0
#pragma HLS INLINE off

	ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> tmpData = 0;

	for(uint8_t i = 0; i < OUTER_SIZE; i = i + NPC)
	{
#pragma HLS LOOP_TRIPCOUNT min=0 max=20/NPC
#pragma HLS PIPELINE rewind
		if (i >= size)
		{
			break;
		}
		for(uint8_t j = 0; j < NPC; j++)
		{
			for (uint8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
			{
#pragma HLS UNROLL
				const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
				ap_uint<8 + bitOffset> colIdx;
				// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
				colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>((i + j) * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
				colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

				tmpData[colIdx] = inData[i + j][yIndex];
			}
		}
	}
	inStream.write(tmpData);
}

// Function Description: return the idx of current data in the sorted data array.
void idxSorted(ap_uint<TS_TYPE_BIT_WIDTH> oriData, ap_uint<TS_TYPE_BIT_WIDTH> tsData[OUTER_SIZE], ap_uint<5> size, ap_uint<5> *newIdx)
{
#pragma HLS ARRAY_PARTITION variable=tsData complete dim=0
#pragma HLS PIPELINE
#pragma HLS INLINE
	ap_uint<5> temp = 0;
	for(uint8_t i = 0; i < OUTER_SIZE; i++ )
	{
		ap_uint<1> cond1 = (tsData[i] < oriData);  // Notice the difference between < and <= here.
		temp += cond1;
//		if (size == INNER_SIZE && i == INNER_SIZE - 1)
//		{
//			*newIdx = temp;
//			return;
//		}
	}
	*newIdx = temp;
}


void sortedTest(ap_uint<5> oriIdx, ap_uint<TS_TYPE_BIT_WIDTH> inData[OUTER_SIZE], ap_uint<5> size, ap_uint<5> *newIdx)
{
#pragma HLS ARRAY_PARTITION variable=inData complete dim=0
#pragma HLS PIPELINE
#pragma HLS INLINE
	ap_uint<5> temp = 0;
	for(uint8_t i = 0; i < OUTER_SIZE; i++ )
	{
		ap_uint<1> cond1 = (inData[i] < inData[oriIdx]);  // Notice the difference between < and <= here.
		temp += cond1;
		if (size == INNER_SIZE && i == INNER_SIZE - 1)
		{
			*newIdx = temp;
			return;
		}
	}
	*newIdx = temp;
}



// Function Description: convert the current data array to sorted idx array.
template<int NPC>
void sortedIdxData(ap_uint<TS_TYPE_BIT_WIDTH> inData[OUTER_SIZE], ap_uint<5> size, ap_uint<5> newIdx[OUTER_SIZE])
{
#pragma HLS INLINE
//#pragma HLS ARRAY_PARTITION variable=newIdx complete dim=0
	for(uint8_t i = 0; i < size; i = i + NPC)
	{
#pragma HLS LOOP_TRIPCOUNT min=0 max=20/NPC
#pragma HLS PIPELINE
		for(uint8_t j = 0; j < NPC; j++)
		{
//			ap_uint<5> tmpIdx;
//			idxSorted(inData[i + j], inData, size, &newIdx[i + j]);
			sortedTest(i + j, inData, size, &newIdx[i + j]);
//			newIdx[i + 0] = tmpIdx;
		}
	}
}


// Function Description: convert the current data array to sorted idx array.
template<int NPC>
void sortedIdxStream(hls::stream< ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> > &tsStream, ap_uint<5> size, ap_uint<5> newIdx[OUTER_SIZE])
{
assert(size <= OUTER_SIZE);
#pragma HLS INLINE off
	ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> tmpData = tsStream.read();
	ap_uint<TS_TYPE_BIT_WIDTH> inData[OUTER_SIZE];

	for(uint8_t j = 0; j < OUTER_SIZE; j++)
	{
#pragma HLS UNROLL
		for (uint8_t yIndex = 0; yIndex < TS_TYPE_BIT_WIDTH; yIndex++)
		{
#pragma HLS UNROLL
			const int bitOffset = LOG_TS_TYPE_BIT_WIDTH;   // This value should be equal to log(TS_TYPE_BIT_WIDTH)
			ap_uint<8 + bitOffset> colIdx;
			// Concatenate and bit shift rather than multiple and accumulation (MAC) can save area.
			colIdx.range(8 + bitOffset - 1, bitOffset) = ap_uint<8 + bitOffset>(j * TS_TYPE_BIT_WIDTH).range(8 + bitOffset - 1, bitOffset);
			colIdx.range(bitOffset - 1, 0) = ap_uint<bitOffset>(yIndex);

			inData[j][yIndex] = tmpData[colIdx];
		}
	}

	for(uint8_t i = 0; i < OUTER_SIZE/NPC; i = i + 1)
	{
// #pragma HLS LOOP_TRIPCOUNT min=0 max=20/NPC
#pragma HLS PIPELINE rewind
		if (i * NPC >= size)
		{
			break;
		}
		for(uint8_t j = 0; j < NPC; j++)
		{
//			ap_uint<5> tmpIdx;
			idxSorted(inData[i * NPC + j], inData, size, &newIdx[i * NPC + j]);
//			newIdx[i + 0] = tmpIdx;
		}
	}
}

template<int NPC>
void checkInnerIdx(ap_uint<5> idxData[INNER_SIZE + 6 - 1], ap_uint<5> size, ap_uint<1> *isCorner)
{
	/* This is a good example to show the LUTs as a function of the NPC
	 * Decreasing factor doesn't mean decreasing the performance.
	 * In this example, change the partition from factor to completely, the LUTs will increase a lot.
	 * The start index is fixed (always the multiple of NPC), so the partition could increase a lot.
	 * Another very interesting thing here is that: if NPC equals to 1, then i become arbitrary again
	 * which is not in a fixed pattern. In this case, multiplxer will be generated again.
	 *
	 * It's also a good example to compare the parameter cyclic and block here.
	 *
	 * The final expression LUTs# is about:  (NPC+2)*icmp + (NPC*2)*and + (NPC+1)*or + 2*adder for only streak length=3.
	 * If multiple streaks are used, the formulation should be derived again.
	 *
	 * The max number of data read from the memory M should be less than 2*factor.
	 * At the same time, NPC should be >= factor. Otherwise select will be synthesed.
	 *
	 * For example, if we the max streak lenght is 6, then the max number of data read from the memory is M = 6 + NPC - 1 = NPC + 5
	 * If we set NPC=2, then factor can only be 1 or 2. Say we choose factor = 2, then M = 7 > 2 * 2. So this is not a good combination.
	 * Set NPC = 4 and factor = 4, M = 9 still bigger than 2 * factor = 8.
	 * So we should use NPC = 5 and factor = 5. The factor should be divided by the size (if size = 20).
	 *
	 * TODO: compare these cases: 1. the loop_count is the multiple of NPC 2. the loop count is not the multiple of NPC
	 * 						      3. decrease M to make II = 1 under NPC = 4 and NPC = 2 to check the resource usage reducing.
	 * */
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=idxData cyclic factor=NPC dim=0
	ap_uint<1> isCornerTemp = 0;
//	if (size == 0)
//	{
//		*isCorner = isCornerTemp;
//		return;
//	}
	for(uint8_t i = 0; i <= OUTER_SIZE/NPC; i = i + 1)   // This multipler form is easier to understand but consume more resources.
	{
#pragma HLS LOOP_TRIPCOUNT min=0 max=16/NPC
#pragma HLS PIPELINE
		InitRegion:
		{
//#pragma HLS LATENCY min=1
			if (i * NPC >= size)
			{
				break;
			}
		}
		ap_uint<1> cond[4][6 + NPC - 1];
		for (uint8_t m = 0; m < 3 + NPC - 1; m++)
		{
			// The condition should be the idxData > (INNER_SIZE -3).
			// However, in order to make the idxSorted could be shared by inner circle and outer circle together.
			// We use a method that compare "size" values to all the input data which has OUTER_SIZE values in total.
			// On the other hand, if the valid input data number is less than OUTER_SIZE, the other input data will be filled with 0.
			// Thus, all the idxData for inner circle value will be added 4 (OUTER_SIZE - INNER_SIZE = 20 - 16 = 4)
			// When we check the innner idx data, we need to remove it.
			cond[0][m] = (idxData[(i * NPC + m)%16] >= INNER_SIZE - 3 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond2[4 + NPC - 1];
		for (uint8_t m = 0; m < 4 + NPC - 1; m++)
		{
			cond[1][m] = (idxData[(i * NPC + m)%16] >= INNER_SIZE - 4 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond3[5 + NPC - 1];
		for (uint8_t m = 0; m < 5 + NPC - 1; m++)
		{
			cond[2][m] = (idxData[(i * NPC + m)%16] >= INNER_SIZE - 5 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond4[6 + NPC - 1];
		for (uint8_t m = 0; m < 6 + NPC - 1; m++)
		{
			cond[3][m] = (idxData[(i * NPC + m)%16] >= INNER_SIZE - 6 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> tempCond[4][NPC];

		for (uint8_t k = 0; k < NPC; k++)
		{
			for (uint8_t n = 0; n < 4; n++)
			{
				tempCond[n][k] = 1;
				for (uint8_t j = 0; j < 3 + n; j++)
				{
					tempCond[n][k] &= cond[n][j + k];
				}
				isCornerTemp |= tempCond[n][k];
//				if (isCornerTemp == 1)
//				{
//					*isCorner = isCornerTemp ;
//					std::cout << "HW: Position is :" << (int)(i * NPC + k) << " and streak size is: " << (int)(n + 3) << std::endl;
//					return;
//				}
			}
		}
		*isCorner = isCornerTemp ;
	}
}


template<int NPC>
void checkInnerIdxV2(ap_uint<5> idxData[INNER_SIZE + 6 - 1], ap_uint<5> size, ap_uint<1> *isCorner)
{
	/* This is a good example to show the LUTs as a function of the NPC
	 * Decreasing factor doesn't mean decreasing the performance.
	 * In this example, change the partition from factor to completely, the LUTs will increase a lot.
	 * The start index is fixed (always the multiple of NPC), so the partition could increase a lot.
	 * Another very interesting thing here is that: if NPC equals to 1, then i become arbitrary again
	 * which is not in a fixed pattern. In this case, multiplxer will be generated again.
	 *
	 * It's also a good example to compare the parameter cyclic and block here.
	 *
	 * The final expression LUTs# is about:  (NPC+2)*icmp + (NPC*2)*and + (NPC+1)*or + 2*adder for only streak length=3.
	 * If multiple streaks are used, the formulation should be derived again.
	 *
	 * The max number of data read from the memory M should be less than 2*factor.
	 * At the same time, NPC should be >= factor. Otherwise select will be synthesed.
	 *
	 * For example, if we the max streak lenght is 6, then the max number of data read from the memory is M = 6 + NPC - 1 = NPC + 5
	 * If we set NPC=2, then factor can only be 1 or 2. Say we choose factor = 2, then M = 7 > 2 * 2. So this is not a good combination.
	 * Set NPC = 4 and factor = 4, M = 9 still bigger than 2 * factor = 8.
	 * So we should use NPC = 5 and factor = 5. The factor should be divided by the size (if size = 20).
	 *
	 * TODO: compare these cases: 1. the loop_count is the multiple of NPC 2. the loop count is not the multiple of NPC
	 * 						      3. decrease M to make II = 1 under NPC = 4 and NPC = 2 to check the resource usage reducing.
	 * */
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=idxData cyclic factor=NPC dim=0
	ap_uint<1> isCornerTemp = 0;
//	if (size == 0)
//	{
//		*isCorner = isCornerTemp;
//		return;
//	}
	for(uint8_t i = 0; i < OUTER_SIZE; i = i + NPC)
	{
#pragma HLS LOOP_TRIPCOUNT min=0 max=16/NPC
#pragma HLS PIPELINE
		InitRegion:
		{
//#pragma HLS LATENCY min=1
			if (i >= size)
			{
				break;
			}
		}
		ap_uint<1> cond[4][6 + NPC - 1];
		for (uint8_t m = 0; m < 3 + NPC - 1; m++)
		{
			// The condition should be the idxData > (INNER_SIZE -3).
			// However, in order to make the idxSorted could be shared by inner circle and outer circle together.
			// We use a method that compare "size" values to all the input data which has OUTER_SIZE values in total.
			// On the other hand, if the valid input data number is less than OUTER_SIZE, the other input data will be filled with 0.
			// Thus, all the idxData for inner circle value will be added 4 (OUTER_SIZE - INNER_SIZE = 20 - 16 =4)
			// When we check the innner idx data, we need to remove it.
			cond[0][m] = (idxData[(i + m)%16] >= INNER_SIZE - 3 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond2[4 + NPC - 1];
		for (uint8_t m = 0; m < 4 + NPC - 1; m++)
		{
			cond[1][m] = (idxData[(i + m)%16] >= INNER_SIZE - 4 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond3[5 + NPC - 1];
		for (uint8_t m = 0; m < 5 + NPC - 1; m++)
		{
			cond[2][m] = (idxData[(i + m)%16] >= INNER_SIZE - 5 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> cond4[6 + NPC - 1];
		for (uint8_t m = 0; m < 6 + NPC - 1; m++)
		{
			cond[3][m] = (idxData[(i + m)%16] >= INNER_SIZE - 6 + OUTER_SIZE - INNER_SIZE);
		}

		ap_uint<1> tempCond[4][NPC];

		for (uint8_t k = 0; k < NPC; k++)
		{
			for (uint8_t n = 0; n < 4; n++)
			{
				tempCond[n][k] = 1;
				for (uint8_t j = 0; j < 3 + n; j++)
				{
					tempCond[n][k] &= cond[n][j + k];
				}
				isCornerTemp |= tempCond[n][k];
//				if (isCornerTemp == 1)
//				{
//					*isCorner = isCornerTemp ;
//					std::cout << "HW: Position is :" << (int)(i + k) << " and streak size is: " << (int)(n + 3) << std::endl;
//					return;
//				}
			}
		}
		*isCorner = isCornerTemp ;
	}
}

template<int NPC>
void checkOuterIdx(ap_uint<5> idxData[OUTER_SIZE + 8 - 1], ap_uint<5> size, ap_uint<1> *isCorner)
{
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=idxData cyclic factor=NPC dim=0

	ap_uint<1> isCornerTemp = 0;
	for(uint8_t i = 0; i < OUTER_SIZE; i = i + NPC)
	{
#pragma HLS LOOP_TRIPCOUNT min=0 max=20/NPC
#pragma HLS PIPELINE
		InitRegion:
		{
//#pragma HLS LATENCY min=1
			if (i >= size)
			{
				break;
			}
		}
		ap_uint<1> cond[5][8 + NPC - 1];
		for (uint8_t m = 0; m < 4 + NPC - 1; m++)
		{
			ap_uint<5> tmpIdx = i + m;
			if (tmpIdx >= OUTER_SIZE) tmpIdx = tmpIdx - OUTER_SIZE;

			cond[0][m] = (idxData[tmpIdx] >= OUTER_SIZE - 4);
		}

		ap_uint<1> cond2[5 + NPC - 1];
		for (uint8_t m = 0; m < 5 + NPC - 1; m++)
		{
			ap_uint<5> tmpIdx = i + m;
			if (tmpIdx >= OUTER_SIZE) tmpIdx = tmpIdx - OUTER_SIZE;

			cond[1][m] = (idxData[tmpIdx] >= OUTER_SIZE - 5);
		}

		ap_uint<1> cond3[6 + NPC - 1];
		for (uint8_t m = 0; m < 6 + NPC - 1; m++)
		{
			ap_uint<5> tmpIdx = i + m;
			if (tmpIdx >= OUTER_SIZE) tmpIdx = tmpIdx - OUTER_SIZE;

			cond[2][m] = (idxData[tmpIdx] >= OUTER_SIZE - 6);
		}

		ap_uint<1> cond4[7 + NPC - 1];
		for (uint8_t m = 0; m < 7 + NPC - 1; m++)
		{
			ap_uint<5> tmpIdx = i + m;
			if (tmpIdx >= OUTER_SIZE) tmpIdx = tmpIdx - OUTER_SIZE;

			cond[3][m] = (idxData[tmpIdx] >= OUTER_SIZE - 7);
		}

		ap_uint<1> cond5[8 + NPC - 1];
		for (uint8_t m = 0; m < 8 + NPC - 1; m++)
		{
			ap_uint<5> tmpIdx = i + m;
			if (tmpIdx >= OUTER_SIZE) tmpIdx = tmpIdx - OUTER_SIZE;

			cond[4][m] = (idxData[tmpIdx] >= OUTER_SIZE - 8);
		}

		ap_uint<1> tempCond[5][NPC];

		for (uint8_t k = 0; k < NPC; k++)
		{
			for (uint8_t n = 0; n < 5; n++)
			{
				tempCond[n][k] = 1;
				for (uint8_t j = 0; j < 4 + n; j++)
				{
					tempCond[n][k] &= cond[n][j + k];
				}
				isCornerTemp |= tempCond[n][k];
//				if (isCornerTemp == 1)
//				{
//					*isCorner = isCornerTemp ;
//					std::cout << "HW: Position is :" << (int)(i + k) << " and streak size is: " << (int)(n + 4) << std::endl;
//					return;
//				}
			}
		}

		*isCorner = isCornerTemp ;
	}
}

template<int NPC>
void checkIdx(ap_uint<5> inData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner)
{
#pragma HLS INLINE off

	if(size == INNER_SIZE)
	{
//		ap_uint<5> idxData[INNER_SIZE + 6 - 1];
//		for (uint8_t i = INNER_SIZE; i < INNER_SIZE + 6 - 1; i++)
//		{
//			idxData[i] = inData[i - INNER_SIZE];
//		}
		checkInnerIdx<NPC>(inData, size, isCorner);
	}
	else if(size == OUTER_SIZE)
	{
//		ap_uint<5> idxData[OUTER_SIZE + 8 - 1];
//		for (uint8_t i = OUTER_SIZE; i < OUTER_SIZE + 8 - 1; i++)
//		{
//			idxData[i] = inData[i - OUTER_SIZE];
//		}
		checkOuterIdx<NPC>(inData, size, isCorner);
	}
	else
	{
		*isCorner = 0;
	}
}


void feedbackStream(ap_uint<1> isStageCorner, hls::stream< ap_uint<2> >  &stageStream, hls::stream< ap_uint<1> > &isFinalCornerStream)
{
#pragma HLS INLINE off
#pragma PIPELINE rewind
	ap_uint<2> outputStage;
	if(glStage == 0)
	{
		if(isStageCorner)
		{
			outputStage =  1;
		}
		else
		{
			outputStage =  2;
		}
	}
	else
	{
		outputStage =  0;
	}

	// Only write the stream at the first part of the event processing.
	if(glFeedbackCounter%2 == 0)
	{
//		stageStream << outputStage;
		isFinalCornerStream << isStageCorner;
	}
	else
	{
		isFinalCornerStream << isStageCorner;
	}
}

void outputResult(hls::stream< ap_uint<1> > &isFinalCornerStream, hls::stream<apUint17_t> &packetEventDataStream, uint32_t *eventSlice)
{
#pragma HLS INLINE
	// Only output the result at the last part of the event processing.
//	if(glFeedbackCounter%2 == 1)
//	{
		apUint17_t tmp1 = apUint17_t(packetEventDataStream.read());
		ap_uint<32> output = tmp1;
		ap_uint<1> isCornerStage0 = isFinalCornerStream.read();
		ap_uint<1> isCornerStage1 = isFinalCornerStream.read();
		ap_uint<1> isCorner = isCornerStage0 & isCornerStage1;
		output[31] = isCorner;

		ap_uint<32> xWr, yWr;
		bool pol;

		xWr = (240 - tmp1 & 0xff);
		yWr = (180 - tmp1 >> 8) & 0xff;
		pol = tmp1.bit(16).to_bool();

		output = (0 << 31) + (yWr << 22) + (xWr << 12)  + (pol << 11) + isCorner;
		*eventSlice++ = output.to_uint();

		*eventSlice++ = output.to_int();
//	}
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
#pragma HLS INTERFACE axis port=data

#pragma HLS DATAFLOW

	ap_uint<2> stage = 0;
	ap_uint<TS_TYPE_BIT_WIDTH> outer[OUTER_SIZE];
	hls::stream< ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> > inStream("dataStream");
#pragma HLS STREAM variable=inStream depth=2 dim=1
#pragma HLS RESOURCE variable=inStream core=FIFO_SRL
	ap_uint<5> size;

    hls::stream<X_TYPE>  xStream("xStream");
    hls::stream<Y_TYPE>  yStream("yStream");
    hls::stream< ap_uint<TS_TYPE_BIT_WIDTH> > tsStream("tsStream");

	hls::stream<apUint17_t> pktEventDataStream("pktEventDataStream");
#pragma HLS STREAM variable=pktEventDataStream depth=2 dim=1
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL

	hls::stream< ap_uint<2> >  stageInStream("stageInStream");
	hls::stream< ap_uint<2> >  stageOutStream("stageOutStream");

	hls::stream< ap_uint<1> > isFinalCornerStream("isFinalCornerStream");

    ap_uint<5> idxData[OUTER_SIZE];
	X_TYPE x;
	Y_TYPE y;
	ap_uint<TS_TYPE_BIT_WIDTH> ts;
    ap_uint<1> isStageCorner;

	ap_uint<1> isCorner;

//	glInitCounter = 0;

	uint16_t eventIterSize = eventsArraySize;

	GetData: for(int i = 0; i < eventIterSize; i++)
	{
#pragma HLS PIPELINE
#pragma HLS LOOP_TRIPCOUNT min=1 max=5000
		getXandY(data++, xStream, yStream, tsStream, pktEventDataStream);
	}

	Processing: for(int i = 0; i < eventIterSize * LOOPS_PER_EVENT; i++)
	{
#pragma HLS LOOP_TRIPCOUNT min=1 max=10000

		DFRegion:
		{
#pragma HLS DATAFLOW
			initStageStream(stageInStream, stageOutStream);
			rwSAEStream<2>(xStream, yStream, tsStream, stageOutStream, outer, &size);

//			std::cout << "Idx stage " << stage[loop] << " Data HW is: " << std::endl;
//			for (int i = 0; i < size; i++)
//			{
//				std::cout << (int)outer[i]<< "\t";
//			}
//			std::cout << std::endl;
		//    sortedIdxData<2>(outer, size, idxData);
			convertInterface<4>(outer, size, inStream);
			sortedIdxStream<2>(inStream, size, idxData);
			checkIdx<4>(idxData, size, &isStageCorner);   // If resource is not enough, decrease this number to increase II a little.
			feedbackStream(isStageCorner, stageInStream, isFinalCornerStream);
		}
	}

	Output: for(int i = 0; i < eventIterSize; i++)
	{
#pragma HLS PIPELINE
#pragma HLS LOOP_TRIPCOUNT min=1 max=5000
		outputResult(isFinalCornerStream, pktEventDataStream, eventSlice++);
	}
}
