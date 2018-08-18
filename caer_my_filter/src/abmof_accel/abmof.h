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

#define DVS_WIDTH  240
#define DVS_HEIGHT 180

int init_socket(int port);
void accumulate(uint16_t x, uint16_t y, bool pol, int64_t ts);


using namespace std;

#endif
