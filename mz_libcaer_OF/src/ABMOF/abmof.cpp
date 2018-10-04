#include "abmof.h"
#include "abmof_hw_accel.h"

// xfopencv
// only used in SDx environment
// #include "xf_headers.h"
// #include "xf_dense_npyr_optical_flow_config.h"


// standard opencv, used in standard opencv environment
#include "opencv2/opencv.hpp"

#include <math.h>

#include "sds_utils.h"


// TODO, hardcode now, should adapt to the real chip size.
uchar slices[SLICES_NUMBER][DVS_HEIGHT][DVS_WIDTH];

// Current slice index
static int8_t currentIdx = 0;

static uint64_t imgNum = 0;
static bool initSocketFlg = false;
static uint16_t retSocket;

static int32_t *eventSlice = (int32_t *)sds_alloc(DVS_HEIGHT * DVS_WIDTH);

// To trigger the tcp to send event slice
static bool sendFlg = false;

static void *displayTCP(void *);

static void *displayUDP(void *);

// TCP server
int init_socket_TCP(int port)
{

    //--------------------------------------------------------
    //networking stuff: socket, bind, listen
    //--------------------------------------------------------
    int                 localSocket,
                        remoteSocket;

    struct  sockaddr_in localAddr,
                        remoteAddr;
    pthread_t thread_id;


    int addrLen = sizeof(struct sockaddr_in);


    localSocket = socket(AF_INET , SOCK_STREAM , 0);
    if (localSocket == -1){
         perror("socket() call failed!!");
    }

    localAddr.sin_family = AF_INET;
    localAddr.sin_addr.s_addr = INADDR_ANY;
    localAddr.sin_port = htons( port );

    if( bind(localSocket,(struct sockaddr *)&localAddr , sizeof(localAddr)) < 0) {
         perror("Can't bind() socket");
         exit(1);
    }

    //Listening
    listen(localSocket , 3);

    std::cout <<  "Waiting for connections...\n"
              <<  "Server Port:" << port << std::endl;

    //accept connection from an incoming client
    // while(1){
    //if (remoteSocket < 0) {
    //    perror("accept failed!");
    //    exit(1);
    //}

     remoteSocket = accept(localSocket, (struct sockaddr *)&remoteAddr, (socklen_t*)&addrLen);
      //std::cout << remoteSocket<< "32"<< std::endl;
    if (remoteSocket < 0) {
        perror("accept failed!");
        exit(1);
    }
    std::cout << "Connection accepted" << std::endl;
     pthread_create(&thread_id,NULL,displayTCP,&remoteSocket);
     pthread_setname_np(thread_id, "SliceDisplay");
     sleep(5);

     //pthread_join(thread_id,NULL);

    // }
    //pthread_join(thread_id,NULL);
    //close(remoteSocket);

    return remoteSocket;
}

static void *displayTCP(void *ptr)
{
    int socket = *(int *)ptr;
    //OpenCV Code
    //----------------------------------------------------------

    cv::Mat img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, CV_8UC1, slices[currentIdx]);
     //make it continuous
    if (!img.isContinuous()) {
        img = img.clone();
    }

    int imgSize = img.total() * img.elemSize();
    int bytes = 0;
    int key;


    std::cout << "Image Size:" << imgSize << std::endl;

    while(1) {
        if(sendFlg)
        {
            /* get a frame from camera */
            img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, CV_8UC1, eventSlice);
            double maxIntensity;
            // cv::minMaxLoc(img, NULL, &maxIntensity);
            // std::cout<<"max value is "<<maxIntensity<<std::endl;
            //do video processing here
            // cvtColor(img, imgGray, CV_BGR2GRAY);

            //send processed image
            if ((bytes = send(socket, img.data, imgSize, 0)) < 0){
                std::cerr << "bytes = " << bytes << std::endl;
                break;
            }
            // sendFlg = false;
        }
    }

}


// UDP server
int init_socket_UDP(int port)
{

    //--------------------------------------------------------
    //networking stuff: socket, bind, listen
    //--------------------------------------------------------
    int                 localSocket,
                        remoteSocket;

    struct  sockaddr_in localAddr,
                        remoteAddr;
    pthread_t thread_id;


    int addrLen = sizeof(struct sockaddr_in);


    localSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
    if (localSocket == -1){
         perror("socket() call failed!!");
    }

    localAddr.sin_family = AF_INET;
    localAddr.sin_addr.s_addr = INADDR_ANY;
    localAddr.sin_port = htons( port );

    if( bind(localSocket,(struct sockaddr *)&localAddr , sizeof(localAddr)) < 0) {
         perror("Can't bind() socket");
         exit(1);
    }

    //Listening
//    listen(localSocket , 3);
//
//    std::cout <<  "Waiting for connections...\n"
//              <<  "Server Port:" << port << std::endl;

    //accept connection from an incoming client
    // while(1){
    //if (remoteSocket < 0) {
    //    perror("accept failed!");
    //    exit(1);
    //}

     // UDP doesn't have accept, we only use localSocket to replace it.
     // remoteSocket = accept(localSocket, (struct sockaddr *)&remoteAddr, (socklen_t*)&addrLen);
    remoteSocket = localSocket;
      //std::cout << remoteSocket<< "32"<< std::endl;
    if (remoteSocket < 0) {
        perror("accept failed!");
        exit(1);
    }
    std::cout << "Connection accepted" << std::endl;
     pthread_create(&thread_id,NULL,displayUDP,(void *)&localSocket);
     pthread_setname_np(thread_id, "SliceDisplay");
     sleep(5);

     //pthread_join(thread_id,NULL);

    // }
    //pthread_join(thread_id,NULL);
    //close(remoteSocket);

    return remoteSocket;
}

static void *displayUDP(void *ptr)
{
    int socket = *(int *)ptr;
    struct  sockaddr_in remoteAddr;
    socklen_t addrLen = sizeof(struct sockaddr_in);

    char buf[10];
    int recvLen;

    std::cout <<  "Waiting for connections...\n" << std::endl;
    //try to receive some data, this is a blocking call
    if ((recvLen = recvfrom(socket, buf, 10, 0, (struct sockaddr *) &remoteAddr, &addrLen)) == -1)
    {
        std::cerr << "bytes = " << recvLen << std::endl;
        return NULL;
    }

    //print details of the client/peer and the data received
    printf("Received packet from %s:%d\n", inet_ntoa(remoteAddr.sin_addr), ntohs(remoteAddr.sin_port));
    printf("Data: %s\n" , buf);

    //OpenCV Code
    //----------------------------------------------------------


    cv::Mat img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, CV_8UC1, slices[currentIdx]);
     //make it continuous
    if (!img.isContinuous()) {
        img = img.clone();
    }

    int imgSize = img.total() * img.elemSize();
    int bytes = 0;
    int key;

    std::cout << "Image Size:" << imgSize << std::endl;

    while(1) {
        if(sendFlg)
        {
            /* get a frame from camera */
            img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, CV_8UC1, eventSlice);
            double maxIntensity;
            // cv::minMaxLoc(img, NULL, &maxIntensity);
            // std::cout<<"max value is "<<maxIntensity<<std::endl;
            //do video processing here
            // cvtColor(img, imgGray, CV_BGR2GRAY);

            //send processed image
            if ((bytes = sendto(socket, (void *)eventSlice, DVS_HEIGHT * DVS_WIDTH, 0, (struct sockaddr*)&remoteAddr, addrLen)) < 0){
                std::cerr << "bytes = " << bytes << std::endl;
                break;
            }
            // sendFlg = false;
        }
    }

}


//void saveImg(char img[DVS_WIDTH][DVS_HEIGHT], long cnt)
//{
//	cv::Mat frame_out = cv::Mat(DVS_WIDTH, DVS_HEIGHT, XF_8UC1, img);
//
//	char out_string[200];
//	sprintf(out_string,"out_%ld.png", cnt);
//
//	cv::imwrite(out_string,frame_out);
//}

void sendEventSlice()
{
    sendFlg = true;
}

void resetSlices()
{
	// clear slices
	for (uchar (&slice)[DVS_HEIGHT][DVS_WIDTH] : slices)
		for (uchar (&row)[240] : slice)
			for (uchar & cell : row)
				cell *= 0;
}

void resetCurrentSlice()
{
	// clear current slice
	for (uchar (&row)[240] : slices[currentIdx])
		for (uchar & cell : row)
			cell *= 0;
}

void accumulate(int16_t x, int16_t y, bool pol, int64_t ts)
{
	if (pol == true)
	{
		slices[currentIdx][y][x] += 1;
	}
}


void rotateSlices()
{
	if(currentIdx == 2)
	{
		currentIdx = 0;
	}
	else
	{
		currentIdx++;
	}
	resetCurrentSlice();
}

float sadDistance(int16_t x, int16_t y, int16_t dx, int16_t dy, int16_t blockRadius)
{
	uint64_t sumRet = 0;
	int8_t sliceTminus1Idx = currentIdx - 1, sliceTminus2Idx = currentIdx - 2;

	// If the index is negative, it means the currentIdx have gone back to 0 or 1.
	if(sliceTminus1Idx < 0) sliceTminus1Idx += 3;
	if(sliceTminus2Idx < 0) sliceTminus2Idx += 3;

	for (int i = x + dx - blockRadius; i <=  x + dx + blockRadius; i++)
	{
		for (int j = y + dy - blockRadius; j <=  y + dy + blockRadius; j++)
		{
			int16_t tempDist = slices[sliceTminus1Idx][y][x] - slices[sliceTminus2Idx][j][i];
			if(tempDist > 0) sumRet += tempDist;
			else sumRet-= tempDist;
		}
	}
	return sumRet;
}

SADResult calculateOF(int16_t x, int16_t y, int16_t searchDistance, int16_t blockSize)
{
	SADResult sadResult;
	sadResult.sadValue = UINT64_MAX;
	sadResult.validFlg = false;

    uint64_t minSum = UINT64_MAX, sum;
    uint64_t sumArray[2 * searchDistance + 1][2 * searchDistance + 1];

	int16_t blockRadius = (blockSize - 1)/2;

    // Make sure both ref block and past slice block are in bounds on all sides or there'll be arrayIndexOutOfBoundary exception.
    // Also we don't want to match ref block only on inner sides or there will be a bias towards motion towards middle
	if (x - blockRadius - searchDistance < 0 || x + blockRadius + searchDistance >= DVS_WIDTH
			|| y - blockRadius - searchDistance < 0 || y + blockRadius + searchDistance >= DVS_HEIGHT)
	{
		return sadResult;
	}

    for (int16_t dx = -searchDistance; dx <= searchDistance; dx++) {
        for (int16_t dy = -searchDistance; dy <= searchDistance; dy++) {
            sum = sadDistance(x, y, dx, dy, blockRadius);
            sumArray[dx + searchDistance][dy + searchDistance] = sum;
            if (sum < minSum) {
                minSum = sum;
                sadResult.dx = -dx; // minus is because result points to the past slice and motion is in the other direction
                sadResult.dy = -dy;
                sadResult.sadValue = minSum;
            }
        }
    }

	return sadResult;
}

void abmof_accel(int16_t x, int16_t y, bool pol, int64_t ts)
{
	accumulate(x, y, pol, ts);
}

int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, int port, int eventThreshold, int socketType)
{
	if (!initSocketFlg)
	{
		if (socketType == 0)     //0 : UDP
		{
			retSocket = init_socket_UDP(port);
		}
		else
		{
			retSocket = init_socket_TCP(port);
		}
		initSocketFlg = true;
	}

	// resetSlices();   // Clear slices before a new packet come in

	imgNum++;

	// Get full timestamp and addresses of first event.
	const libcaer::events::PolarityEvent &firstEvent = (*polarityPkt)[0];

	int32_t ts = firstEvent.getTimestamp();
	uint16_t x = firstEvent.getX();
	uint16_t y = firstEvent.getY();
	bool pol   = firstEvent.getPolarity();

	int32_t eventsArraySize = (*polarityPkt).getEventNumber();
	int32_t eventPerSize = (*polarityPkt).getEventSize();

    // Make suer sds_alloc allocate a right memory for eventSlice.
	if(eventSlice == NULL)
	{
		eventSlice = (int32_t *)sds_alloc(DVS_HEIGHT * DVS_WIDTH);
		return retSocket;
	}
	if(eventsArraySize >= eventThreshold)
	{
		eventsArraySize = eventThreshold;
	}

	// Currently we need to make eventSlice a static pointer, otherwise the display thread may have
	// competence with this main thread. To achieve this, we must specify the size of eventSlice.
	// For software, this might not be an issue since eventSlice is a FIFO which doesn't have address
	// when implemented on hardware.
	if(eventsArraySize >= DVS_HEIGHT * DVS_WIDTH / 4)
	{
		eventsArraySize = DVS_HEIGHT * DVS_WIDTH / 4;
	}

	uint64_t * data = (uint64_t *)sds_alloc(eventsArraySize * eventPerSize);
	memcpy(data, (void *)&(firstEvent.data), eventsArraySize * eventPerSize);
    sds_utils::perf_counter hw_ctr, sw_ctr;

    hw_ctr.start();
    // reset the eventSlice
    memset((char *) eventSlice, 0, DVS_HEIGHT * DVS_WIDTH);

	parseEvents(data, eventsArraySize, eventSlice);
	hw_ctr.stop();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;

    sds_free(data);
	sendEventSlice();

//	int i = 0;
//	for (auto &tmpEvent : *polarityPkt)
//	{
//		i++;
//		int32_t ts = tmpEvent.getTimestamp();
//		uint16_t x = tmpEvent.getX();
//		uint16_t y = tmpEvent.getY();
//		bool pol   = tmpEvent.getPolarity();
//
//		accumulate(x, y, pol, ts);
//
//		// printf("Current event - ts: %d, x: %d, y: %d, pol: %d.\n", ts, x, y, pol);
//	}
//	printf("eventSize is %d, eventCap is %d, i is %d", polarity->getEventNumber(), polarity->getEventCapacity(), i);

	return retSocket;
}
