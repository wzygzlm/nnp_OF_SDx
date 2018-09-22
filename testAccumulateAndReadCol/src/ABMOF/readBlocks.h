#ifndef READBLOCKS
#define READBLOCKS

#include<stdint.h>
#include "ap_int.h"

#define POLARITY_SHIFT 1
#define POLARITY_MASK 0x00000001
#define POLARITY_Y_ADDR_SHIFT 2
#define POLARITY_Y_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs
#define POLARITY_X_ADDR_SHIFT 17
#define POLARITY_X_ADDR_MASK 0x000001FF      //  Reduce mask bit width to reduce LUTs

#define SLICES_NUMBER 4
#define SLICE_WIDTH  256
#define SLICE_HEIGHT 256

#define DVS_WIDTH  240
#define DVS_HEIGHT 180

#define BITS_PER_PIXEL 4
#define COMBINED_PIXELS 32

#define BLOCK_SIZE 11
#define SEARCH_DISTANCE 3

typedef ap_int<BITS_PER_PIXEL> pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL> col_pix_t;
typedef ap_int<COMBINED_PIXELS * BITS_PER_PIXEL * 2> two_cols_pix_t;
typedef ap_uint<2> sliceIdx_t;

void readBlockCols(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE]);

void writePix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);
pix_t readPix(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx);

#pragma SDS data access_pattern(refCol:SEQUENTIAL, tagCol:SEQUENTIAL)
#pragma SDS data copy(refCol[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE], tagCol[0:BLOCK_SIZE + 2 * SEARCH_DISTANCE])
void topHW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE]);

#endif
