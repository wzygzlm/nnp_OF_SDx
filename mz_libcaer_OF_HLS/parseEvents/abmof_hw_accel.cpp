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
			eventSlice[i * DVS_WIDTH + j] = glPLSlices[glPLSliceIdx][i][j];
		}
	}
}

void resetCurrentSliceHW()
{
	// clear current slice
	resetSliceLoop: for(int16_t i = 0; i < DVS_HEIGHT; i++)
	{
		resetSliceLoop2:for(int16_t j = 0; j < DVS_WIDTH; j++)
		{
			glPLSlices[glPLSliceIdx][i][j] = 0;
		}
	}
}

void parseEvents(const uint32_t * data, int32_t eventsArraySize, int8_t *eventSlice)
{
	resetCurrentSliceHW();

	// Every event always consists of 2 int32_t which is 8bytes.
	loop_1:for(int32_t i = 0; i < eventsArraySize * 2; i = i + 2)
	{

		int16_t x = ((data[i]) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		int16_t y = ((data[i]) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((data[i]) >> POLARITY_SHIFT) & POLARITY_MASK;;
		// int64_t ts = data[i+1];

		// ts is unsued, should remove it.
		accumulateHW(x, y, pol, 0);
	}

	copyToPS(eventSlice);
}
