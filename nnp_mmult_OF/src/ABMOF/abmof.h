#ifndef ABMOF
#define ABMOF

// libcaer
#include <libcaer/devices/davis.hpp>

// socket
#include <iostream>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <unistd.h>
#include <string.h>

#define DVS_WIDTH  240
#define DVS_HEIGHT 180

using namespace std;

int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, int port);
void accumulate(const libcaer::events::PolarityEvent currentEvt);


#endif
