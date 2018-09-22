#ifndef ABMOF
#define ABMOF

// libcaer
#include <libcaercpp/devices/davis.hpp>

// socket
#include <iostream>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <unistd.h>
#include <string.h>


struct SADResult {
	uint16_t dx;
	uint16_t dy;
	bool validFlg;
	uint64_t sadValue;
};

int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, int port, int eventThreshold, int socketType);

using namespace std;

#endif
