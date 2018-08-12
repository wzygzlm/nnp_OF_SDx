/**********
Copyright (c) 2018, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
may be used to endorse or promote products derived from this software
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********/


/******************************************************************************

    This is a simple vector addition based example to showcase how SG DMA
    can be enabled for data transfer to/from hardware accelerator.

******************************************************************************/



#include <iostream>
#include <cstdio>
#include <stdlib.h>
#include "vadd.h"
#include "sds_utils.h"

const int TEST_DATA_SIZE = 1<<10;

// Compare software and hardware solutions
bool verify(int *gold, int *out, int size) {
    for(int i = 0; i < size; i++){
        if(gold[i] != out[i]){
            std::cout<< "Result Mismatch at index=" << i 
                << " Expected=" << gold[i] 
                << " Actual=" << out[i] << "\n";
            return false;
        }
  }
  return true;
}

int main(int argc, char** argv)
{

    bool test_passed;
    int test_size   = TEST_DATA_SIZE;

    // Explicitly using malloc here for memory allocation to demonstrate
    // Scatter-Gather DMA functionality. malloc does not give guarantee of 
    // continuous physical memory allocation. So such kind of memory allocations 
    // should be transferred to Hardware Function using Scatter-Gather DMA  
    // for correct functionality.
    int *a      = (int *) malloc(sizeof(int) * test_size);
    int *b      = (int *) malloc(sizeof(int) * test_size);
    int *gold   = (int *)malloc(sizeof(int) * test_size);
    int *hw_results = (int *) malloc(sizeof(int) * test_size);

    //Checking for failed allocation
    if ( (a == NULL) || (b == NULL) || (gold == NULL)  || (hw_results == NULL)){
        std::cout  << "TEST FAILED: Failed to allocate Memory" << std::endl;
        return -1;
    }


    //Creating Test Data and golden data
    for (int i = 0 ; i < test_size ; i++){
        a[i] = rand();
        b[i] = rand();
        gold[i] = a[i] + b[i]; // Calculating Golden value
        hw_results[i] = 0 ;     
    }

    sds_utils::perf_counter vadd_hw_ctr;

    vadd_hw_ctr.start();
    //Launch the Hardware Solution
    vadd_hw(a, b, hw_results, test_size);
    vadd_hw_ctr.stop();
    
    uint64_t vadd_hw_cycles = vadd_hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                << vadd_hw_cycles << std::endl;
  
    test_passed = verify(gold, hw_results, test_size);

    free(a);
    free(b);
    free(hw_results);
    free(gold);

    std::cout << "TEST " << (test_passed ? "PASSED" : "FAILED") << std::endl;

    return (test_passed ? 0 : 1);
}
