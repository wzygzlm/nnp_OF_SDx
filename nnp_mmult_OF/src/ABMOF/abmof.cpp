#include "abmof.h"

// xfopencv
#include "xf_headers.h"
#include "xf_dense_npyr_optical_flow_config.h"

// slice_1 is current slice, slice_2 is t-1 slice and slice_3 is t-2 slice.
// TODO, hardcode now, should adapt to the real chip size.
char slice_1[DVS_WIDTH][DVS_HEIGHT], slice_2[DVS_WIDTH][DVS_HEIGHT], slice_3[DVS_WIDTH][DVS_HEIGHT];

long imgNum = 0;

void saveImg(char img[DVS_WIDTH][DVS_HEIGHT], long cnt)
{
	cv::Mat frame_out = cv::Mat(DVS_WIDTH, DVS_HEIGHT, XF_8UC1, img);

	char out_string[200];
	sprintf(out_string,"out_%ld.png", cnt);

	cv::imwrite(out_string,frame_out);
}

void abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt)
{
	saveImg(slice_1, imgNum);
	imgNum++;
	const libcaer::events::PolarityEventPacket *polarity = polarityPkt.get();
	int i = 0;
	for (auto &tmpEvent : *polarityPkt)
	{
		i++;
		int32_t ts = tmpEvent.getTimestamp();
		uint16_t x = tmpEvent.getX();
		uint16_t y = tmpEvent.getY();
		bool pol   = tmpEvent.getPolarity();

		accumulate(tmpEvent);

		// printf("Current event - ts: %d, x: %d, y: %d, pol: %d.\n", ts, x, y, pol);
	}
	printf("eventSize is %d, eventCap is %d, i is %d", polarity->getEventNumber(), polarity->getEventCapacity(), i);
}

void accumulate(const libcaer::events::PolarityEvent currentEvt)
{
	int32_t ts = currentEvt.getTimestamp();
	uint16_t x = currentEvt.getX();
	uint16_t y = currentEvt.getY();
	bool pol   = currentEvt.getPolarity();
	slice_1[x][y] += (int)pol;
}

void reset()
{
	// clear slices
	for (char (&row)[180] : slice_1)
	    for (char & cell : row)
	        cell *= 0;

	for (char (&row)[180] : slice_2)
	    for (char & cell : row)
	        cell *= 0;

	for (char (&row)[180] : slice_3)
	    for (char & cell : row)
	        cell *= 0;
}
