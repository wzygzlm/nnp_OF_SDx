#ifndef CALCDATAFLOW
#define CALCDATAFLOW

#include<stdint.h>
#include "ap_int.h"

#define BLOCK_SIZE 11
#define BITS_PER_PIXEL 4
#define SEARCH_DISTANCE 3

typedef ap_int<BITS_PER_PIXEL> pixel_t;

void colSADSum(pixel_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pixel_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1]);

void blockSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE][BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[BLOCK_SIZE + 2 * SEARCH_DISTANCE][2*SEARCH_DISTANCE + 1]);

#pragma SDS data copy(t1Block[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE], t2Block[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE])
#pragma SDS data access_pattern(miniSumRet:SEQUENTIAL)
#pragma SDS data copy(miniSumRet[0:1])
void miniSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE], ap_int<16> *miniSumRet);

// #pragma SDS data data_mover(data:AXIFIFO:1, eventSlice:AXIFIFO:2)
//#pragma SDS data data_mover(t1Block:AXIDMA_SIMPLE:1, t2Block:AXIDMA_SIMPLE:2)
//#pragma SDS data access_pattern(miniSumRet:SEQUENTIAL)
//#pragma SDS data zero_copy(input1[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE], input2[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE])
void miniSADSumHW(ap_int<128> input1, ap_int<128> input2, ap_int<16> *output);

#endif
