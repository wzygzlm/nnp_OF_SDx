#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <cstdlib>
using namespace std;
#include "ap_fixed.h"
#include "calcDataFlow.h"
#include "time.h"
 #include "sds_utils.h"

using namespace std;

#define TEST_TIMES 100

void colSADSumSW(pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t out[2 * SEARCH_DISTANCE + 1])
{
	cout << "in1 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in1[m] << " ";
	}
	cout << endl;

	cout << "in2 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in2[m] << " ";
	}
	cout << endl;

	for(int i = 0; i <= 2 * SEARCH_DISTANCE; i++)
	{
		int16_t tmpOut = 0;
		for(int j = 0; j < BLOCK_SIZE; j++)
		{
			tmpOut += abs(in1[j] - in2[i+j]);
		}
//		cout << "tmpOut is " << tmpOut << endl;
		out[i] = tmpOut;
	}
}


static ap_int<16> miniRetVal[2*SEARCH_DISTANCE + 1] = {0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff};
static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1] = {0, 0, 0, 0, 0, 0, 0};
static ap_int<16> localSumReg[2*SEARCH_DISTANCE + 1][2*SEARCH_DISTANCE + 1];

static int16_t testTmpSum;
void miniSADSumSW(pixel_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pixel_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		ap_int<16> *miniSumRet)
{
	static int16_t shiftCnt = 0;
	int16_t out[2*SEARCH_DISTANCE + 1];

	colSADSumSW(in1, in2, out);


	for(int8_t i = 0; i < 2*SEARCH_DISTANCE; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[2*SEARCH_DISTANCE][j] = out[j];
	}

	for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = 0;
		for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			miniSumTmp[i] += localSumReg[j][i];
		}
		miniRetVal[i] = (miniSumTmp[i] < miniRetVal[i]) && (shiftCnt >= 2*SEARCH_DISTANCE) ? miniSumTmp[i] : miniRetVal[i];
	}

	cout << "miniSumTmp is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniSumTmp[m] << " ";
	}
	cout << endl;

	cout << "miniRetVal is: " << endl;
	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
	{
		cout << miniRetVal[m] << " ";
	}
	cout << endl;

	// Convert it to standard c type, so min function could be used.
	uint16_t intMiniRetVal[2*SEARCH_DISTANCE + 1];
	for (int j = 0; j <= 2 * SEARCH_DISTANCE; j++)
	{
		intMiniRetVal[j] = miniRetVal[j].to_short();
	}

	testTmpSum = *min_element(intMiniRetVal, intMiniRetVal + 2*SEARCH_DISTANCE + 1);
	cout << "Minimal value in int16_t is: " << testTmpSum << endl;
	*miniSumRet = ap_int<16>(*min_element(miniRetVal, miniRetVal + 2*SEARCH_DISTANCE + 1));

	shiftCnt++;
}

void miniSADSumSWWrap(ap_int<128> in1,
		ap_int<128> in2,
		ap_int<16> *miniSumRet)
{
	pixel_t in1Wrap[BLOCK_SIZE + 2 * SEARCH_DISTANCE], in2Wrap[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	for (int8_t i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		in1Wrap[i] = in1.range(4*i + 3, 4*i);
		in2Wrap[i] = in2.range(4*i + 3, 4*i);
	}
	miniSADSumSW(in1Wrap, in2Wrap, miniSumRet);
}

int main(int argc, char *argv[])
{
	int testTimes = TEST_TIMES;
    if (argc == 2) testTimes = atoi(argv[1]);

	ap_int<128> input1,
			input2;
	ap_int<16> miniSum, miniSumSW;

    int err_cnt = 0;
	int retval=0;

	srand((unsigned)time(NULL));
	for(int k = 0; k < testTimes; k++)
	{
		cout << "Test " << k << ":" << endl;

		for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
		{
			input1.range(4*j + 3, 4*j) = rand() % 16;
			input2.range(4*j + 3, 4*j) = rand() % 16;
		}
	    sds_utils::perf_counter hw_ctr, sw_ctr;

	    sw_ctr.start();
	    //Launch the Software Solution
	    miniSADSumSWWrap(input1, input2, &miniSumSW);
	    sw_ctr.stop();

	    hw_ctr.start();
	    //Launch the Hardware Solution
//	    miniSADSum(input1, input2, &miniSum);
	    miniSADSumHW(input1, input2, &miniSum);
	    hw_ctr.stop();

		// Compare the results file with the golden results
		cout << "miniSum is: " << miniSum << endl;
//		for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << sumArray[m] << " ";
//		}
//		cout << endl;

		cout << "miniSumSW is: " << miniSumSW << endl;
//		for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//		{
//			cout << sumArraySW[m] << " ";
//		}
//		cout << endl;

		for(int i = 0; i < 2 * SEARCH_DISTANCE + 1; i++)
		{
			if(miniSum != miniSumSW)
			{
				err_cnt++;
				cout<<"!!! ERROR: Mismatch detected at index" << i << "!!!" << endl;
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

		cout << endl;
	}

	if (err_cnt == 0) {
		cout<<"*** TEST PASSED ***" << endl;
		retval = 0;
	} else {
		cout<<"!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
		cout<< endl;
		retval = -1;
	}

	// Return 0 if the test passes
	return retval;
}
