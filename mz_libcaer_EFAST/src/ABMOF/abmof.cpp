#include "abmof.h"
#include "abmof_hw_accel.h"

#include "PracticalSocket.h"      // For UDPSocket and SocketException

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

static uint64_t *eventSlice = (uint64_t *)sds_alloc(8 * MAX_SIZE_PER_DATA_PKT);
static int32_t eventsArraySize = 0; // Share this between the UDP thread and the main thread.
static uint32_t packetCounter = 0;

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

static UDPSocket sock;
string serverIP = "192.168.0.100";
unsigned short socketPort = 8991;

static void *displayUDP(void *ptr)
{
    int socket = *(int *)ptr;

	struct sockaddr_in destAddr;


    struct  sockaddr_in remoteAddr;
    socklen_t addrLen = sizeof(struct sockaddr_in);

    char buf[10];
    int recvLen;

    std::cout <<  "Waiting for connections...\n" << std::endl;
    //try to receive some data, this is a blocking call
//    if ((recvLen = recvfrom(socket, buf, 10, 0, (struct sockaddr *) &remoteAddr, &addrLen)) == -1)
//    {
//        std::cerr << "bytes = " << recvLen << std::endl;
//        return NULL;
//    }
//
//    //print details of the client/peer and the data received
//    printf("Received packet from %s:%d\n", inet_ntoa(remoteAddr.sin_addr), ntohs(remoteAddr.sin_port));
//    printf("Data: %s\n" , buf);

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

            int total_pack = eventsArraySize / 1000 + 1;
        	int ibuf[1];
        	ibuf[0] = total_pack;
//        	sock.sendTo(ibuf, sizeof(int), serverIP, socketPort);

        	for (int i = 0; i < total_pack; i++)
        	{
        		uint32_t *tmpBuffer = (uint32_t *)malloc(8000);
        		tmpBuffer[0] = packetCounter;
        		tmpBuffer[1001] = 0x55aa55aa;
        		memcpy((void *)(& tmpBuffer[1]), (void *)(& eventSlice[i * 1000]), 4000);
        		sock.sendTo(tmpBuffer, 4000, serverIP, socketPort);
        		packetCounter++;
        		free(tmpBuffer);
        	}

//            //send processed image
//            if ((bytes = sendto(socket, (void *)(eventSlice), DVS_HEIGHT * DVS_WIDTH, 0, (struct sockaddr*)&destAddr, destAddrLen)) < 0){
//                std::cerr << "bytes = " << bytes << std::endl;
//                break;
//            }
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

int creatEventdataFromFile(std::string filename, int startLine, int event_num, uint64_t *data)
{
    ifstream file(filename);
    string str;
    vector<int> values;
    uint64_t *begin = 0;
    begin = data;

    // Nothing is executed until we arrived the desired line.
    for (int lineno = 0; getline (file,str) && lineno < startLine; lineno++);

    int lineCnt = 0;
    std::cout << "Start reading line: " << startLine << std::endl;
    while (getline(file, str))
    {
        stringstream stream(str);
        uint64_t ts;
        int x;
        int y;
        int polarity;
        int OF_x;
        int OF_y;
        stream >> ts;
        stream >> x;
        stream >> y;
        stream >> polarity;
        stream >> OF_x;
        stream >> OF_y;

        // y = DVS_HEIGHT -1 - y;   // OpenCV and jaer has inverse y coordinate.

        if( y >= DVS_HEIGHT || y < 0 )  std::cout << "ts is :" << ts << "\t x is: " << x << "\t y is :" << y << "\t pol is:" << polarity << std::endl;
        if( x >= DVS_WIDTH || x < 0 )  std::cout << "ts is :" << ts << "\t x is: " << x << "\t y is :" << y << "\t pol is:" << polarity << std::endl;

        uint64_t temp = 0;
        temp = (ts << 32) + ((3 - OF_y) << 29) + ((3 - OF_x) << 26) + (x << 17) + (y << 2) + (polarity << 1) + 1;
        *data++ = temp;

        if(lineCnt >= event_num)
        {
            break;
        }
        lineCnt++;
    }

    data = begin;
    return lineCnt;
}

static int simulationEventSpeed = 0;
static int currentStartLine = 0;
static int total_err_cnt = 0;
int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, char *serverIPIP, int socketPort, int udpSplitPktSize, int socketType, std::string filename, std::ofstream &resultStream)
{
	if (!initSocketFlg)
	{
		serverIP = serverIPIP;
		socketPort = 8991;

//		if (socketType == 0)     //0 : UDP
//		{
//			retSocket = init_socket_UDP(4097);
//		}
//		else
//		{
//			retSocket = init_socket_TCP(4097);
//		}
		initSocketFlg = true;
	}

	// resetSlices();   // Clear slices before a new packet come in

	imgNum++;
    sendFlg = false;

	// Get full timestamp and addresses of first event.
	const libcaer::events::PolarityEvent &firstEvent = (*polarityPkt)[0];

	int32_t ts = firstEvent.getTimestamp();
	uint16_t x = firstEvent.getX();
	uint16_t y = firstEvent.getY();
	bool pol   = firstEvent.getPolarity();

	eventsArraySize = (*polarityPkt).getEventNumber();
	int32_t eventPerSize = (*polarityPkt).getEventSize();

    // Make suer sds_alloc allocate a right memory for eventSlice.
	if(eventSlice == NULL)
	{
		eventSlice = (uint64_t *)sds_alloc(8 * MAX_SIZE_PER_DATA_PKT);
		return retSocket;
	}

//    eventsArraySize = 3000;
//    eventPerSize = 8;

//	if(eventsArraySize >= eventThreshold)
//	{
//		eventsArraySize = eventThreshold;
//	}

	// Currently we need to make eventSlice a static pointer, otherwise the display thread may have
	// competence with this main thread. To achieve this, we must specify the size of eventSlice.
	// For software, this might not be an issue since eventSlice is a FIFO which doesn't have address
	// when implemented on hardware.
	if(eventsArraySize >= MAX_SIZE_PER_DATA_PKT)
	{
		eventsArraySize = MAX_SIZE_PER_DATA_PKT;
	}

	uint64_t * data = (uint64_t *)sds_alloc(MAX_SIZE_PER_DATA_PKT * eventPerSize);
	memcpy(data, (void *)&(firstEvent.data), eventsArraySize * eventPerSize);
    sds_utils::perf_counter hw_ctr, sw_ctr;

    sw_ctr.start();
    int32_t eventSliceSW[DVS_HEIGHT * DVS_WIDTH];
//    parseEventsSW(data, eventsArraySize, eventSliceSW);
    sw_ctr.stop();

    // reset the eventSlice
    memset((char *) eventSlice, 0, 8 * MAX_SIZE_PER_DATA_PKT);

    int event_num = eventsArraySize;
//    eventsArraySize = creatEventdataFromFile(filename, currentStartLine, event_num, data);
    //creatEventdata(60+(simulationEventSpeed)%30 , 60, event_num, data);
    // creatEventdata_solid(60+(simulationEventSpeed)%30 , 60, 0, data);
    simulationEventSpeed = simulationEventSpeed + 2;

    if (eventsArraySize < event_num) currentStartLine = 0;
    else currentStartLine += event_num;

    hw_ctr.start();
    ap_uint<1> led;
	parseEvents(data, eventsArraySize, eventSlice, &led);
	hw_ctr.stop();

	if (udpSplitPktSize * 8 >= 8000) // Limit the udpSplitPktSize due to the wifi connection.
	{
		udpSplitPktSize = 1000;
	}

    int total_pack = eventsArraySize / udpSplitPktSize + 1;
	int ibuf[1];
	ibuf[0] = total_pack;
	int eventsNumRemain = eventsArraySize;
//        	sock.sendTo(ibuf, sizeof(int), serverIP, socketPort);

	for (int i = 0; i < total_pack; i++)
	{
		int eventsNumToSend = udpSplitPktSize;
		if (eventsNumRemain < udpSplitPktSize)
		{
			eventsNumToSend = eventsNumRemain;
		}

		// Empty packet, ignore it.
		if(eventsNumToSend == 0)
		{
			break;
		}

		uint8_t *tmpBuffer = (uint8_t *)malloc(1024 * 8);  // Max size of the buffer is 8K due to the wifi limitation.
//		uint32_t packetCounterSwapEndian;    // Convert the endian order.
//		packetCounterSwapEndian = ((packetCounter >> 24) & 0xff) + ( ((packetCounter >> 16) & 0xff) << 8) +
//				( ((packetCounter >> 8) & 0xff) << 16) + ( ((packetCounter >> 0) & 0xff) << 24);
		tmpBuffer[0] = (packetCounter >> 0) & 0xff;
		tmpBuffer[1] = (packetCounter >> 8) & 0xff;
		tmpBuffer[2] = (packetCounter >> 16) & 0xff;
		tmpBuffer[3] = (packetCounter >> 24) & 0xff;
//		tmpBuffer[1001] = 0x55aa55aa;
		memcpy((void *)(& tmpBuffer[4]), (void *)(& eventSlice[i * eventsNumToSend]), eventsNumToSend * 8);
		sock.sendTo(tmpBuffer, eventsNumToSend * 8 + 4, serverIP, socketPort);  // udpSplitPktSize * 8 + 4 is the event number per packet + sizeof(packetheader).

		eventsNumRemain -= eventsNumToSend;
		packetCounter++;
		free(tmpBuffer);
	}

	int err_cnt = 0;

//	for (int m = 0; m < eventsArraySize; m++)
//	{
//		ap_uint<3> OF_x = ((eventSlice[m] >> 17) & 0x7);
//		ap_uint<3> OF_y = ((eventSlice[m] >> 20) & 0x7);
//		ap_uint<6> OFRet = OF_y.concat(OF_x);
//
//		short xWr = (eventSlice[m] & 0xff);
//		short yWr = ((eventSlice[m] >> 8) & 0xff);
//
//		ap_uint<1> polWr = ((eventSlice[m] >> 16) & 0x1);
//
//		uint64_t tmpData = *data++;
//		ap_uint<3> OFGT_x = (tmpData >> 26);
//		ap_uint<3> OFGT_y = (tmpData >> 29);
//		ap_uint<6> OFGT = OFGT_y.concat(OFGT_x);
//		uint32_t tsWr = (tmpData >> 32);
//
//        // check result, only check valid result
//		if(OFRet != 0x3f)
//		{
//			if(!(xWr - BLOCK_SIZE/2 - SEARCH_DISTANCE < 0 || xWr + BLOCK_SIZE/2 + SEARCH_DISTANCE >= DVS_WIDTH
//				   || yWr - BLOCK_SIZE/2 - SEARCH_DISTANCE < 0 || yWr + BLOCK_SIZE/2 + SEARCH_DISTANCE >= DVS_HEIGHT))
//			{
//				if(OFRet != OFGT)
//				{
//					cout << "Found error at index: " << m << endl;
//					cout << "x is:  " << xWr << "\t y is: " << yWr << "\t ts is: " << tsWr << endl;
//
//					err_cnt++;
////					resultStream  << (currentStartLine - event_num + m) << " " << xWr << " " << yWr << " " << polWr << " " <<  OF_x << " "
////							<<  OF_y << " " << tsWr << std::endl;
//				}
//			}
//		}
//		resultStream  << (currentStartLine - event_num + m) << " " << xWr << " " << yWr << " " << polWr << " " <<  OF_x << " "
//				<<  OF_y << " " << tsWr << std::endl;
//	}
//
//	if(err_cnt == 0)
//	{
//		cout << "Test " << imgNum << " passed." << endl;
//	}
//	total_err_cnt += err_cnt;
//	if (total_err_cnt == 0)
//	{
//			cout<<"*** WHOLE TEST PASSED ***" << endl;
//	} else
//	{
//			cout<<"!!! WHOLE TEST FAILED - " << total_err_cnt << " mismatches detected !!!";
//			cout<< endl;
//	}

	uint64_t sw_cycles = sw_ctr.avg_cpu_cycles();
    uint64_t hw_cycles = hw_ctr.avg_cpu_cycles();

//    std::cout << "Number of CPU cycles running application in software: "
//                << sw_cycles << std::endl;

    std::cout << "Number of CPU cycles running application in hardware: "
                << hw_cycles << std::endl;

//    int cmpRet;
//
//    cmpRet = memcmp( eventSliceSW, eventSlice, eventsArraySize);
//
//    if (cmpRet != 0) std::cout << "Test failed" << std::endl;

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
