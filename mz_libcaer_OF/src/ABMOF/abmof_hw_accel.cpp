#include "abmof_hw_accel.h"

static int8_t glPLSlices[SLICES_NUMBER][DVS_HEIGHT][DVS_WIDTH];
static int8_t glPLSliceIdx;

void accumulateHW(int16_t x, int16_t y, bool pol, int64_t ts)
{
	if (pol == true)
	{
		glPLSlices[glPLSliceIdx][y][x] += 1;
	}
}

// #pragma SDS data zero_copy(eventSlice[0:DVS_WIDTH * DVS_HEIGHT])
void copyToPS(int8_t *eventSlice)
{
	copyToPSLoop: for(int16_t i = 0; i < DVS_HEIGHT; i++)
	{
		copyToPS_label2:for(int16_t j = 0; j < DVS_WIDTH; j++)
		{
#pragma HLS PIPELINE
			eventSlice[i * DVS_WIDTH + j] = glPLSlices[glPLSliceIdx][i][j];
		}
	}
}

void resetCurrentSliceHW()
{
	// clear current slice
	resetSliceLoop: for(int16_t i = 0; i < DVS_HEIGHT; i++)
	{
#pragma HLS PIPELINE
		resetSliceLoop2:for(int16_t j = 0; j < DVS_WIDTH; j++)
		{
#pragma HLS PIPELINE
			glPLSlices[glPLSliceIdx][i][j] = 0;
		}
	}
}

#pragma SDS data access_pattern(data:SEQUENTIAL, eventSlice:SEQUENTIAL)
// #pragma SDS data data_mover(data:AXIFIFO:1, eventSlice:AXIFIFO:2)
// #pragma SDS data buffer_depth(data:512, eventSlice:1)
#pragma SDS data data_mover(data:AXIDMA_SIMPLE:1, eventSlice:AXIDMA_SIMPLE:2)
#pragma SDS data copy(data[0:eventsArraySize * 2], eventSlice[0:eventsArraySize])
#pragma SDS data mem_attribute(data:PHYSICAL_CONTIGUOUS, eventSlice:PHYSICAL_CONTIGUOUS)
// #pragma SDS data zero_copy(eventSlice[0:DVS_WIDTH * DVS_HEIGHT])
void parseEvents(const uint32_t * data, int32_t eventsArraySize, int32_t *eventSlice)
{
// #pragma HLS INTERFACE ap_fifo port=data
#pragma HLS ARRAY_PARTITION variable=glPLSlices block factor=16 dim=3
#pragma HLS LATENCY min=1
	resetCurrentSliceHW();

	// Every event always consists of 2 int32_t which is 8bytes.
	loop_1:for(int32_t i = 0; i < eventsArraySize * 2; i = i + 2)
	{
#pragma HLS PIPELINE
		#pragma HLS loop_tripcount min=0 max=10000
		uint32_t tmp = data[i];
		int16_t x = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		int16_t y = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = data[i+1];

		// ts is unsued, should remove it.
		accumulateHW(x, y, pol, ts);

		// Reorder the data to make it easier to be parsed.
		*eventSlice++ = x + (y << 8) + (pol << 16);
	}


	// copyToPS(eventSlice);
}
