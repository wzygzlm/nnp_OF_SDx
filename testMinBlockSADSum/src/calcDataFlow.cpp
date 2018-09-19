#include "calcDataFlow.h"
#include <iostream>
//#include "hls_video.h"


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

void sad(pixel_t refBlock[BLOCK_SIZE], pixel_t targetBlocks[BLOCK_SIZE], int16_t *sadRet)
{
#pragma HLS INLINE off
#pragma HLS PIPELINE
	int16_t retVal = 0;
	ap_int<pixel_t::width+1> sum[BLOCK_SIZE];
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

void colSADSum(pixel_t t1Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			pixel_t t2Col[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
			int16_t retVal[2*SEARCH_DISTANCE + 1])
{
#pragma HLS ARRAY_PARTITION variable=retVal complete dim=0
#pragma HLS ARRAY_PARTITION variable=t2Col complete dim=0
#pragma HLS ARRAY_PARTITION variable=t1Col complete dim=0
#pragma HLS INLINE off
#pragma HLS PIPELINE
	colSADSumLoop:for(ap_uint<4> i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		pixel_t input1[BLOCK_SIZE], input2[BLOCK_SIZE];
#pragma HLS ARRAY_PARTITION variable=input1 complete dim=0
#pragma HLS ARRAY_PARTITION variable=input2 complete dim=0
		colSADSumInnerLoop:for(ap_uint<4> j = 0; j < BLOCK_SIZE; j++)
		{
#pragma HLS UNROLL factor=2
			input1[j] = t1Col[j];
			input2[j] = t2Col[i+j];
		}
		sad(input1, input2, &retVal[i]);
	}

}

void blockSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t sumBlock[2*SEARCH_DISTANCE + 1])
{
#pragma HLS PIPELINE
#pragma HLS ARRAY_RESHAPE variable=sumBlock complete dim=1
#pragma HLS ARRAY_RESHAPE variable=t2Block complete dim=1
#pragma HLS ARRAY_RESHAPE variable=t1Block complete dim=1
//	blockSADSumLoop:for (int i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
//	{
		pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
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
ap_int<16> min(ap_int<16> inArr[2*SEARCH_DISTANCE + 1])
{
#pragma HLS INLINE off
#pragma HLS PIPELINE
#pragma HLS ARRAY_PARTITION variable=inArr complete dim=0
	ap_int<16> tmp = inArr[0];
	minLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE + 1; i++)
	{
#pragma HLS UNROLL
		// Here is a bug. Use the if-else statement,
		// cannot use the question mark statement.
		// Otherwise a lot of muxs will be generated,
		// DON'T KNOW WHY. SHOULD BE A BUG.
		if(inArr[i] < tmp) tmp = inArr[i];
//		tmp = (inArr[i] < tmp) ? inArr[i] : tmp;
	}
	return tmp;
}


void miniSADSum(pixel_t t1Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t t2Block[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
#pragma HLS ARRAY_PARTITION variable=t2Block complete dim=0
#pragma HLS ARRAY_PARTITION variable=t1Block complete dim=0
#pragma HLS PIPELINE
	// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
	static ap_int<16> miniRetVal = 0x7fff;
	static ap_int<16> miniRetValTmpIter;
	static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1];
	static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];
#pragma HLS ARRAY_PARTITION variable=localSumReg complete dim=0
	static int16_t shiftCnt = 0;

	pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
	int16_t out[2*SEARCH_DISTANCE + 1];

	readColLoop:for (int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
	{
		in1[j] = t1Block[j];
		in2[j] = t2Block[j];
	}

	colSADSum(in1, in2, out);

	addLoop: for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = miniSumTmp[i] + out[i] - localSumReg[0][i];
//		miniRetVal = (miniRetValTmpIter < miniSumTmp[i]) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniSumTmp[i];
//		else miniRetVal[i] = miniRetVal[i];
	}
	miniRetValTmpIter = min(miniSumTmp);
	// Use a new register to store the old value and use the return value as the new value.
	miniRetVal = (miniRetValTmpIter < miniRetVal) && (shiftCnt >= 2 * SEARCH_DISTANCE) ? miniRetValTmpIter : miniRetVal;

	shiftMainLoop: for(int8_t i = 0; i < 2*SEARCH_DISTANCE; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	shiftLastLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[2*SEARCH_DISTANCE][j] = out[j];
	}

	shiftCnt++;

//	outputRetLoop:for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
//	{
		*miniSumRet = miniRetVal;
//	}
}

void miniSADSumHW(ap_int<128> input1, ap_int<128> input2, ap_int<16> *output)
{
#pragma HLS PIPELINE
    // Local memory is implemented as BRAM memory blocks
	pixel_t A[BLOCK_SIZE + 2 * SEARCH_DISTANCE], B[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

    //partitioning Array A and B
    #pragma HLS DATA_PACK variable=A
    #pragma HLS DATA_PACK variable=B

    // Burst reads on input matrices from DDR memory
    // Burst read for matrix A and B
    // Multiple memory interfaces are supported by default in SDSoC
    // It is possible to fetch both A and B concurrently.
    readA:
    for (int itr = 0; itr < BLOCK_SIZE + 2 * SEARCH_DISTANCE; itr++) {
    #pragma HLS PIPELINE
//    #pragma HLS LOOP_TRIPCOUNT min=17 max=17
        A[itr] = input1.range(4*itr + 3, 4*itr);
        B[itr] = input2.range(4*itr + 3, 4*itr);
    }

    miniSADSum(A, B, output);
}
