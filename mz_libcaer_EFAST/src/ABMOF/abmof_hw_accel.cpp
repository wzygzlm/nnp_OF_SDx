#include "abmof_hw_accel.h"
#include "ap_int.h"
#include <iostream>
#include "ap_int.h"
#include "hls_stream.h"
#include "assert.h"

// SAE (Surface of Active Event)
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

const ap_int<128> innerTest =  ap_int<128>("03132231303f2e1d0dfdeedfd0d1e2f3", 16);
const ap_int<160> outerTest = ap_int<160>("0414233241404f3e2d1c0cfceddecfc0c1d2e3f4", 16);


// Function Description: return the minimum value of an array.
template<typename DATA_TYPE, int DATA_SIZE>
DATA_TYPE min(DATA_TYPE inArr[DATA_SIZE], int8_t *index)
{
//#pragma HLS PIPELINE
//#pragma HLS ARRAY_RESHAPE variable=inArr complete dim=1
#pragma HLS INLINE off
	DATA_TYPE tmp = inArr[0];
	int8_t tmpIdx = 0;
	minLoop: for(int8_t i = 0; i < DATA_SIZE; i++)
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

// Function Description: return the idx of current data in the sorted data array.
//void idxSorted(ap_uint<TS_TYPE_BIT_WIDTH> oriData, ap_uint<TS_TYPE_BIT_WIDTH> tsData[OUTER_SIZE], ap_uint<5> size, ap_uint<5> *newIdx)
//{
//#pragma HLS ARRAY_PARTITION variable=tsData cyclic factor=8 dim=0
//#pragma HLS INLINE
//	assert(size==16||size==20||size==0);
//	if(size == 0)
//	{
//		*newIdx = 0;
//		return;
//	}
//
//	ap_uint<5> temp = 0;
//	for(uint8_t i = 0; i < size; i = i + 16 )
//	{
//#pragma HLS PIPELINE
//#pragma HLS LOOP_TRIPCOUNT min=0 max=2
//		for(uint8_t j = 0; j < 16; j++)
//		{
//			ap_uint<1> cond1 = (tsData[i + j] < oriData);  // Notice the difference between < and <= here.
//			temp += cond1;
//		}
//	}
//	*newIdx = temp;
//}


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

// Convert index data to the bool version data. It has two types, one for INNER circle and the other for OUTER circle.
template<int NPC>
void idxDataToIdxInnerBoolData(ap_uint<5> newIdx[OUTER_SIZE], ap_uint<5> size, ap_uint<4> condFlg[OUTER_SIZE])
{
assert(size<=OUTER_SIZE);
#pragma HLS ARRAY_PARTITION variable=condFlg cyclic factor=NPC dim=0
//#pragma HLS ARRAY_PARTITION variable=condFlg complete dim=0
#pragma HLS ARRAY_PARTITION variable=newIdx cyclic factor=NPC/2 dim=0
// #pragma HLS ARRAY_PARTITION variable=newIdx complete dim=0

	for(uint8_t i = 0; i <= OUTER_SIZE/NPC; i = i + 1)
	{
#pragma HLS PIPELINE
		InitRegion:
		{
//#pragma HLS LATENCY min=1
			if (i * NPC >= size)
			{
				break;
			}
		}
		for(uint8_t j = 0; j < NPC; j++)
		{
			uint8_t tmpIndex = i * NPC + j;
			ap_uint<5> tmpNewIdx = newIdx[tmpIndex];
			ap_uint<4> tmpTmp;
			// The condition should be the idxData > (INNER_SIZE -3).
			// However, in order to make the idxSorted could be shared by inner circle and outer circle together.
			// We use a method that compare "size" values to all the input data which has OUTER_SIZE values in total.
			// On the other hand, if the valid input data number is less than OUTER_SIZE, the other input data will be filled with 0.
			// Thus, all the idxData for inner circle value will be added 4 (OUTER_SIZE - INNER_SIZE = 20 - 16 =4)
			// When we check the innner idx data, we need to remove it.
			tmpTmp[0] = (tmpNewIdx  >= INNER_SIZE - 3 + OUTER_SIZE - INNER_SIZE);
			tmpTmp[1] = (tmpNewIdx  >= INNER_SIZE - 4 + OUTER_SIZE - INNER_SIZE);
			tmpTmp[2] = (tmpNewIdx  >= INNER_SIZE - 5 + OUTER_SIZE - INNER_SIZE);
			tmpTmp[3] = (tmpNewIdx  >= INNER_SIZE - 6 + OUTER_SIZE - INNER_SIZE);
			condFlg[tmpIndex] = tmpTmp;
		}
	}
}

template<int NPC>
void idxInnerBoolDataToCorner(ap_uint<4> condFlg[INNER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner)
{
#pragma HLS ARRAY_PARTITION variable=condFlg cyclic factor=NPC dim=0

	ap_uint<1> isCornerTemp = 0;
	ap_uint<4> tempCond[NPC];
#pragma HLS ARRAY_PARTITION variable=tempCond complete dim=0

	ap_uint<4> cond[INNER_SIZE];
#pragma HLS ARRAY_PARTITION variable=cond complete dim=0

	for (uint8_t i = 0; i < INNER_SIZE; i = i + 2 * NPC)
	{
#pragma HLS PIPELINE
		for (uint8_t k = 0; k < 2 * NPC; k++)
		{
			cond[i + k] = condFlg[i + k];
		}
	}

	for(uint8_t i = 0; i <= OUTER_SIZE/NPC; i = i + 1)
	{
#pragma HLS PIPELINE
		InitRegion:
		{
//#pragma HLS LATENCY min=1
			if (i * NPC >= size)
			{
				break;
			}
		}

		for (uint8_t k = 0; k < NPC; k++)
		{
			tempCond[k] = ap_uint<4>(15);
			for (uint8_t n = 0; n < 4; n++)
			{
				for (uint8_t j = 0; j < 3 + n; j++)
				{
					ap_uint<5> tmpIdx = i * NPC + j + k;
					if (tmpIdx >= INNER_SIZE) tmpIdx = tmpIdx - INNER_SIZE;

					ap_uint<1> tmpTmp = tempCond[k][n];
					tmpTmp = tmpTmp & cond[tmpIdx][n];
					tempCond[k][n] = tmpTmp;
				}
				isCornerTemp |= tempCond[k][n];
			}
		}
	}
	*isCorner = isCornerTemp;
}

void testSortedIdxData(hls::stream< ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> > &tsStream, ap_uint<5> size, ap_uint<5> newIdx[OUTER_SIZE])
{
#pragma HLS ARRAY_PARTITION variable=newIdx complete dim=0

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

	sortedIdxData<2>(inData, size, newIdx);

//	sortedIdxStream<2>(tsStream, size, newIdx);
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
//					std::cout << "HW: Position is :" << (int)(i + k) << " and streak size is: " << (int)(n + 3) << std::endl;
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
	for(uint8_t i = 0; i <= OUTER_SIZE/NPC; i = i + 1)
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
			// Thus, all the idxData for inner circle value will be added 4 (OUTER_SIZE - INNER_SIZE = 20 - 16 =4)
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
//					std::cout << "HW: Position is :" << (int)(i + k) << " and streak size is: " << (int)(n + 3) << std::endl;
//					return;
//				}
			}
		}
		*isCorner = isCornerTemp ;
	}
}


template<int NPC>
void checkOuterIdx(ap_uint<5> idxData[OUTER_SIZE + 8 - 1], ap_uint<1> *isCorner)
{
#pragma HLS INLINE
#pragma HLS ARRAY_PARTITION variable=idxData cyclic factor=NPC dim=0

	ap_uint<1> isCornerTemp = 0;
	for(uint8_t i = 0; i < OUTER_SIZE; i = i + NPC)
	{
#pragma HLS PIPELINE rewind
		ap_uint<1> cond[5][8 + NPC - 1];
		for (uint8_t m = 0; m < 4 + NPC - 1; m++)
		{
			cond[0][m] = (idxData[i + m] >= OUTER_SIZE - 4);
		}

		ap_uint<1> cond2[5 + NPC - 1];
		for (uint8_t m = 0; m < 5 + NPC - 1; m++)
		{
			cond[1][m] = (idxData[i + m] >= OUTER_SIZE - 5);
		}

		ap_uint<1> cond3[6 + NPC - 1];
		for (uint8_t m = 0; m < 6 + NPC - 1; m++)
		{
			cond[2][m] = (idxData[i + m] >= OUTER_SIZE - 6);
		}

		ap_uint<1> cond4[7 + NPC - 1];
		for (uint8_t m = 0; m < 7 + NPC - 1; m++)
		{
			cond[3][m] = (idxData[i + m] >= OUTER_SIZE - 7);
		}

		ap_uint<1> cond5[8 + NPC - 1];
		for (uint8_t m = 0; m < 8 + NPC - 1; m++)
		{
			cond[4][m] = (idxData[i + m] >= OUTER_SIZE - 8);
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
			}
		}

		*isCorner = isCornerTemp ;
	}
}

void testCheckInnerIdx(ap_uint<5> idxData[INNER_SIZE + 6 - 1], ap_uint<5> size, ap_uint<1> *isCorner)
{
//	checkInnerIdx<5>(idxData, size, isCorner);   // If resource is not enough, decrease this number to increase II a little.
	checkInnerIdxV2<4>(idxData, size, isCorner);   // If resource is not enough, decrease this number to increase II a little.
}

void testCheckOuterIdx(ap_uint<5> idxData[OUTER_SIZE + 8 - 1], ap_uint<1> *isCorner)
{
	checkOuterIdx<5>(idxData, isCorner);    // NPC = 7 could make II = 1 but we might not need so fast.
}

void checkIdx(ap_uint<5> inData[OUTER_SIZE], ap_uint<5> size, ap_uint<1> *isCorner)
{
	if(size == INNER_SIZE)
	{
		ap_uint<5> idxData[INNER_SIZE + 6 - 1];
		for (uint8_t i = INNER_SIZE; i < INNER_SIZE + 6 - 1; i++)
		{
			idxData[i] = inData[i - INNER_SIZE];
		}
		checkInnerIdx<5>(idxData, size, isCorner);
	}
	else if(size == 20)
	{
		ap_uint<5> idxData[OUTER_SIZE + 8 - 1];
		for (uint8_t i = OUTER_SIZE; i < OUTER_SIZE + 8 - 1; i++)
		{
			idxData[i] = inData[i - OUTER_SIZE];
		}
		checkOuterIdx<5>(idxData, isCorner);
	}
	else
	{
		*isCorner = 0;
	}
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

void getXandY(const uint64_t * data, X_TYPE *x, Y_TYPE *y, ap_uint<TS_TYPE_BIT_WIDTH> *ts, hls::stream<apUint17_t> &packetEventDataStream)
{
#pragma HLS PIPELINE
	uint64_t tmp = *data;
	*x = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
	*y = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
	bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
	*ts = tmp >> 32;
}


template<int READ_NPC>   //  Due to the memory has 2 ports at most for arbitrary reading, here this number could be only 1 or 2.
void rwSAE(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> ts, ap_uint<2>  stage, ap_uint<TS_TYPE_BIT_WIDTH> outputData[OUTER_SIZE], ap_uint<5> *size)
{
//#pragma HLS RESOURCE variable=saeHW core=RAM_T2P_BRAM
#pragma HLS INLINE off
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
	            	ap_uint<8> tmpIndex;
	            	tmpIndex.range(7, 2 + READ_NPC) = ap_uint<8>(i * 8).range(7, 2 + READ_NPC);
	            	tmpIndex.range(1 + READ_NPC, 0) = j.range(1 + READ_NPC, 0);
	            	xInnerTest[j] = innerTest[tmpIndex];
	            	xOuterTest[j] = outerTest[tmpIndex];
	            }

	            readNPCLoop:
	            for (ap_uint<8> k = 0; k < READ_NPC; k++)
	            {
	                xInner[k] = x + xInnerTest(8 * k + 3, 8  * k);
	                yInner[k] = y + xInnerTest(8 * k + 7, 8 * k + 4);
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

	        ap_uint<8 * READ_NPC> xOuterTest;
	        X_TYPE xOuter[READ_NPC];
	        Y_TYPE yOuter[READ_NPC], yOuterNewIdx[READ_NPC];
	    	rwSAEReadOuterOffsetBitsLoop:
	        for (ap_uint<8> j = 0; j < 8 * READ_NPC; j++)
	        {
	#pragma HLS UNROLL
	        	ap_uint<8> tmpIndex;
	        	tmpIndex.range(7, 2 + READ_NPC) = ap_uint<8>(i * 8).range(7, 2 + READ_NPC);
	        	tmpIndex.range(1 + READ_NPC, 0) = j.range(1 + READ_NPC, 0);
	        	xOuterTest[j] = outerTest[tmpIndex];
	        }

	        readOuterNPCLoop:
	        for (ap_uint<8> k = 0; k < READ_NPC; k++)
	        {
	            xOuter[k] = x + xOuterTest(8 * k + 3, 8  * k);
	            yOuter[k] = y + xOuterTest(8 * k + 7, 8 * k + 4);
	            yOuterNewIdx[k] = yOuter[k]%RESHAPE_FACTOR;

	            outputData[i + k] = readOneDataFromCol(saeHW[0][yOuter[k]/RESHAPE_FACTOR][xOuter[k]], yOuterNewIdx[k]);
	        }
		}

		*size = OUTER_SIZE;
	}
	else
	{
		*size = 0;
	}
}


template<int READ_NPC>
void readOutterCircle(X_TYPE x, Y_TYPE y, ap_uint<TS_TYPE_BIT_WIDTH> outerCircle[OUTER_SIZE])
{
	readOuterCircleFromSAE:for(ap_uint<8> i = 0; i < OUTER_SIZE; i = i + READ_NPC)
	{
#pragma HLS DEPENDENCE variable=saeHW inter false
#pragma HLS PIPELINE rewind

        ap_uint<8 * READ_NPC> xOuterTest;
        X_TYPE xOuter[READ_NPC];
        Y_TYPE yOuter[READ_NPC], yOuterNewIdx[READ_NPC];
    	rwSAEReadOuterOffsetBitsLoop:
        for (ap_uint<8> j = 0; j < 8 * READ_NPC; j++)
        {
#pragma HLS UNROLL
        	ap_uint<8> tmpIndex;
        	tmpIndex.range(7, 2 + READ_NPC) = ap_uint<8>(i * 8).range(7, 2 + READ_NPC);
        	tmpIndex.range(1 + READ_NPC, 0) = j.range(1 + READ_NPC, 0);
        	xOuterTest[j] = outerTest[tmpIndex];
        }

        readOuterNPCLoop:
        for (ap_uint<8> k = 0; k < READ_NPC; k++)
        {
            xOuter[k] = x + xOuterTest(8 * k + 3, 8  * k);
            yOuter[k] = y + xOuterTest(8 * k + 7, 8 * k + 4);
            yOuterNewIdx[k] = yOuter[k]%RESHAPE_FACTOR;

            outerCircle[i + k] = readOneDataFromCol(saeHW[0][yOuter[k]/RESHAPE_FACTOR][xOuter[k]], yOuterNewIdx[k]);
        }
	}
}

void outputResult(ap_uint<1> isCorner,  hls::stream<apUint17_t> &packetEventDataStream, uint32_t *eventSlice)
{
	apUint17_t tmp1 = packetEventDataStream.read();
//	apUint15_t miniSumRet = 0;
//	ap_int<9> tmp2 = miniSumRet.range(8, 0);
//	apUint6_t tmpOF = isCorner;

	ap_uint<32> output = tmp1;
	output[31] = isCorner;
	output[30] = isCorner;
	output[29] = isCorner;
	output[28] = isCorner;
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
	*eventSlice++ = output.to_int();
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
#pragma HLS DATAFLOW
    ap_uint<TS_TYPE_BIT_WIDTH> outer[OUTER_SIZE];
    hls::stream< ap_uint<TS_TYPE_BIT_WIDTH * OUTER_SIZE> > inStream("dataStream");
#pragma HLS STREAM variable=inStream depth=2 dim=1
#pragma HLS RESOURCE variable=inStream core=FIFO_SRL

	hls::stream<apUint17_t> pktEventDataStream("EventStream");
#pragma HLS STREAM variable=pktEventDataStream depth=2 dim=1
#pragma HLS RESOURCE variable=pktEventDataStream core=FIFO_SRL
    ap_uint<5> size;
    ap_uint<5> idxData[OUTER_SIZE];
	X_TYPE x;
	Y_TYPE y;
	ap_uint<TS_TYPE_BIT_WIDTH> ts;
	ap_uint<1> isCorner;

	getXandY(data, &x, &y, &ts, pktEventDataStream);
    rwSAE<2>(x, y, ts, 0, outer, &size);
//    sortedIdxData<2>(outer, size, idxData);
    convertInterface<4>(outer, size, inStream);
	sortedIdxStream<4>(inStream, size, idxData);
	checkInnerIdx<4>(idxData, size, &isCorner);   // If resource is not enough, decrease this number to increase II a little.
	outputResult(isCorner, pktEventDataStream, eventSlice++);
}
