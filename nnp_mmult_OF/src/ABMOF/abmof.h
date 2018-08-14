#ifndef ABMOF
#define ABMOF

// libcaer
#include <libcaer/devices/davis.hpp>



#define DVS_WIDTH  240
#define DVS_HEIGHT 180

using namespace std;

void abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt);
void accumulate(const libcaer::events::PolarityEvent currentEvt);


#endif
