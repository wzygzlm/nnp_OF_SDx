#ifndef ABMOF_HW_ACCEL
#define ABMOF_HW_ACCEL

#include<stdint.h>

#define POLARITY_SHIFT 1
#define POLARITY_MASK 0x00000001
#define POLARITY_Y_ADDR_SHIFT 2
#define POLARITY_Y_ADDR_MASK 0x00007FFF
#define POLARITY_X_ADDR_SHIFT 17
#define POLARITY_X_ADDR_MASK 0x00007FFF

#define SLICES_NUMBER 3
#define DVS_WIDTH  240
#define DVS_HEIGHT 180

#define BITS_PER_PIXEL 1

#define BLOCK_SIZE 3
#define SEARCH_DISTANCE 4

void parseEvents(const uint32_t * data, int32_t eventsArraySize, int32_t *eventSlice);

#endif
