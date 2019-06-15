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

static uint32_t *eventSlice = (uint32_t *)sds_alloc(DVS_HEIGHT * DVS_WIDTH);

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

            int total_pack = DVS_HEIGHT * DVS_WIDTH / 7600;
        	int ibuf[1];
        	ibuf[0] = total_pack;
//        	sock.sendTo(ibuf, sizeof(int), serverIP, socketPort);

        	for (int i = 0; i < total_pack; i++)
        		sock.sendTo((void *)(& eventSlice[i * 7600/4]), 7600, serverIP, socketPort);

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


#define TEST_TIMES 10

static col_pix_t slicesSW[SLICES_NUMBER][SLICE_WIDTH][SLICE_HEIGHT/COMBINED_PIXELS];
static sliceIdx_t glPLActiveSliceIdxSW = 0;

void resetPixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	slicesSW[sliceIdx][x][y/COMBINED_PIXELS] = 0;
}

void writePixSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdx)
{
	int8_t yNewIdx = y%COMBINED_PIXELS;
	cout << "Data before write : " << slicesSW[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
	pix_t tmp = slicesSW[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx);
	tmp += 1;
	slicesSW[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) = tmp;
	cout << "Data after write : " << slicesSW[sliceIdx][x][y/COMBINED_PIXELS].range(4 * yNewIdx + 3, 4 * yNewIdx) << endl;
}

void readBlockColsSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t sliceIdxRef, sliceIdx_t sliceIdxTag,
		pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	two_cols_pix_t refColData;
	// concatenate two columns together
	refColData = (slicesSW[sliceIdxRef][x][y/COMBINED_PIXELS], slicesSW[sliceIdxRef][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);
//	cout << "refColData: " << refColData.range(255, 192) << endl;

	// concatenate two columns together
	two_cols_pix_t tagColData;
	// Use explicit cast here, otherwise it will generate a lot of select operations which consumes more LUTs than MUXs.
	tagColData = (slicesSW[(sliceIdx_t)(sliceIdxTag + 0)][x][y/COMBINED_PIXELS], slicesSW[(sliceIdx_t)(sliceIdxTag + 0)][x][ap_uint<3>(y/COMBINED_PIXELS - 1)]);

	// find the bottom pixel of the column that centered on y.
	ap_uint<6> yColOffsetIdx = y%COMBINED_PIXELS - BLOCK_SIZE/2 - SEARCH_DISTANCE + COMBINED_PIXELS;

	readRefLoop: for(ap_uint<8> i = 0; i < BLOCK_SIZE + 2 * SEARCH_DISTANCE; i++)
	{
		refCol[i] = refColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		tagCol[i] = tagColData.range(yColOffsetIdx * 4 + 3, yColOffsetIdx * 4);
		yColOffsetIdx++;
	}
}

void colSADSumSW(pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t out[2 * SEARCH_DISTANCE + 1])
{
	cout << "in1 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in1[m] << " ";
	}
	cout << endl;

	cout << "in2 is: " << endl;
	for (int m = 0; m < BLOCK_SIZE + 2 * SEARCH_DISTANCE; m++)
	{
		cout << in2[m] << " ";
	}
	cout << endl;

	for(int i = 0; i <= 2 * SEARCH_DISTANCE; i++)
	{
		int16_t tmpOut = 0;
		for(int j = 0; j < BLOCK_SIZE; j++)
		{
			tmpOut += abs(in1[j + SEARCH_DISTANCE] - in2[i+j]);  // in1 should get the col data centered on current event.
		}
//		cout << "tmpOut is " << tmpOut << endl;
		out[i] = tmpOut;
	}
}

// Set the initial value as the max integer, cannot be 0x7fff, DON'T KNOW WHY.
static ap_int<16> miniRetVal = 0x7fff;
static ap_uint<6> minOFRet = ap_uint<6>(0xff);

static ap_int<16> miniSumTmp[2*SEARCH_DISTANCE + 1] = {0, 0, 0, 0, 0, 0, 0};
static ap_int<16> localSumReg[BLOCK_SIZE][2*SEARCH_DISTANCE + 1];

static int16_t testTmpSum;
void miniSADSumSW(pix_t in1[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		pix_t in2[BLOCK_SIZE + 2 * SEARCH_DISTANCE],
		int16_t shiftCnt,
		ap_int<16> *miniSumRet,
		ap_uint<6> *OFRet)
{
	int16_t out[2*SEARCH_DISTANCE + 1];

	colSADSumSW(in1, in2, out);

	ap_uint<1> cond1 = (shiftCnt >= BLOCK_SIZE - 1) ? 1 : 0;
	for(int8_t i = 0; i < BLOCK_SIZE - 1; i++)
	{
		shiftInnerLoop: for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
		{
			localSumReg[i][j] = localSumReg[i + 1][j];
		}
	}

	for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
	{
		localSumReg[BLOCK_SIZE - 1][j] = out[j];
	}


	ap_uint<3> OFRet_x = minOFRet.range(2, 0);
	ap_uint<3> OFRet_y = minOFRet.range(5, 3);

	for(int8_t i = 0; i <= 2*SEARCH_DISTANCE; i++)
	{
		miniSumTmp[i] = 0;
		for(int8_t j = 0; j <= BLOCK_SIZE - 1; j++)
		{
			miniSumTmp[i] += localSumReg[j][i];
		}
	}

//	cout << "miniSumTmp is: " << endl;
//	for (int m = 0; m <= 2 * SEARCH_DISTANCE; m++)
//	{
//		cout << miniSumTmp[m] << " ";
//	}
//	cout << endl;

	// Find the minimal of current column.
	ap_int<16> miniRetValTmpIter = ap_int<16>(*min_element(miniSumTmp, miniSumTmp + 2*SEARCH_DISTANCE + 1));
	int miniIdx = distance(miniSumTmp, min_element(miniSumTmp, miniSumTmp + 2*SEARCH_DISTANCE + 1));

	// Compare with current global minimum value.
	if (miniRetValTmpIter < miniRetVal)
	{
		if((shiftCnt >= BLOCK_SIZE - 1))
		{
			miniRetVal = miniRetValTmpIter;     // Update the global value
			OFRet_x = ap_uint<3>(shiftCnt - BLOCK_SIZE + 1);   // Record the shift value and store it in OFRet_x
			OFRet_y = ap_uint<3>(miniIdx);
			minOFRet = OFRet_y.concat(OFRet_x);     // Update the OF value.
//			cout << "OF and global minimum updated at index shiftCnt: " << shiftCnt << endl;
		}
	}

	cout << "OF_x is: " << OFRet_x << "\t OF_y is: " << OFRet_y << endl;

	*miniSumRet = miniRetVal;
	*OFRet = minOFRet;

	std::cout << "miniSumRetSW is: " << *miniSumRet << "\t OFRetSW is: " << std::hex << *OFRet << std::endl;
	std::cout << std::dec;    // Restore dec mode
}

void testMiniSADSumWrapperSW(apIntBlockCol_t *input1, apIntBlockCol_t *input2, int16_t eventCnt, apUint15_t *miniSum, apUint6_t *OF)
{
	pix_t ref[BLOCK_SIZE + 2 * SEARCH_DISTANCE], tag[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

	apIntBlockCol_t inData1, inData2;
	ap_int<16> miniSumSWRet;
	ap_uint<6> OFRetSWRet;

	for(int32_t i = 0; i < eventCnt; i++)
	{
		// Initialize the localSumReg
		for(int idx1 = 0; idx1 < BLOCK_SIZE; idx1++)
		{
			for(int idx2 = 0; idx2 < BLOCK_SIZE; idx2++)
			{
				localSumReg[idx1][idx2] = 0;
			}
		}
		miniRetVal = 0x7fff;
		minOFRet = ap_uint<6>(0xff);

		for(int shiftOffset = 0; shiftOffset < BLOCK_SIZE + 2 * SEARCH_DISTANCE; shiftOffset++)
		{
			cout << "current iteration index is: " << i * (BLOCK_SIZE + 2 * SEARCH_DISTANCE) + shiftOffset << endl;
			inData1 = *input1++;
			inData2 = *input2++;

			for(int j = 0; j < BLOCK_SIZE + 2 * SEARCH_DISTANCE; j++)
			{
				ref[j] = pix_t(inData1.range(4*j + 3, 4*j));
				tag[j] = pix_t(inData2.range(4*j + 3, 4*j));
			}

			miniSADSumSW(ref, tag, shiftOffset, &miniSumSWRet, &OFRetSWRet);
		}

		std::cout << "miniSumRetSW is: " << apUint15_t(miniSumSWRet) << "\t OFRetSW is: " << std::hex << OFRetSWRet << std::endl;
		cout << dec;

		miniSum[i] = apUint15_t(miniSumSWRet);
		OF[i] = OFRetSWRet;
	}
}

void testSingleRwslicesSW(ap_uint<8> x, ap_uint<8> y, sliceIdx_t idx, pix_t refCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE], pix_t tagCol[BLOCK_SIZE + 2 * SEARCH_DISTANCE])
{
	writePixSW(x, y, idx);
	readBlockColsSW(x, y, idx + 1, idx + 2, refCol, tagCol);
	resetPixSW(x, y, idx + 3);
}

void testRwslicesSW(uint64_t * data, sliceIdx_t idx, int16_t eventCnt, apIntBlockCol_t *refData, apIntBlockCol_t *tagData)
{
	// Check the accumulation slice is clear or not
	for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
	{
		for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
		{
			if (slicesSW[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
			{
				cout << "Ha! I caught you, the pixel which is not clear!" << endl;
				cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << endl;
			}
		}
	}

	for(int32_t i = 0; i < eventCnt; i++)
	{
		uint64_t tmp = *data++;
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		writePixSW(xWr, yWr, idx);

		resetPixSW(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//		cout << "tmp is: " << hex << tmp << endl;
//		cout << "x is: " << xWr << "\t y is: " << yWr << "\t idx is: " << idx << endl;

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE; xOffSet++)
		{
			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

			readBlockColsSW(xWr + xOffSet, yWr , idx + 1, idx + 2, out1, out2);

			apIntBlockCol_t refBlockCol;
			apIntBlockCol_t tagBlockCol;

			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
				tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
			}

			*refData++ = refBlockCol;
			*tagData++ = tagBlockCol;
		}
	}


	for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
	}
}

void testTempSW(uint64_t * data, sliceIdx_t idx, int16_t eventCnt, int32_t *eventSlice)
{
	// Check the accumulation slice is clear or not
	for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
	{
		for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
		{
			if (slicesSW[idx][xAddr][yAddr/COMBINED_PIXELS] != 0)
			{
				for(int r = 0; r < 1000; r++)
				{
					cout << "Ha! I caught you, the pixel which is not clear!" << endl;
					cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << idx << endl;
				}
			}
		}
	}

	ap_int<16> miniSumSWRet;
	ap_uint<6> OFRetSWRet;

	for(int32_t i = 0; i < eventCnt; i++)
	{
		uint64_t tmp = *data++;
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		writePixSW(xWr, yWr, idx);

		resetPixSW(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//		cout << "tmp is: " << hex << tmp << endl;
//		cout << "x is: " << xWr << "\t y is: " << yWr << "\t idx is: " << idx << endl;

		// Initialize the localSumReg
		for(int idx1 = 0; idx1 < BLOCK_SIZE; idx1++)
		{
			for(int idx2 = 0; idx2 < BLOCK_SIZE; idx2++)
			{
				localSumReg[idx1][idx2] = 0;
			}
		}
		miniRetVal = 0x7fff;
		minOFRet = ap_uint<6>(0xff);

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE; xOffSet++)
		{
			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];

//				resetPix(xRd + xOffSet, yRd , (sliceIdx_t)(idx + 3));

//			resetPix(xRd + xOffSet, 1 , (sliceIdx_t)(idx + 3));

			readBlockColsSW(xWr + xOffSet, yWr , idx + 1, idx + 2, out1, out2);

			apIntBlockCol_t refBlockCol;
			apIntBlockCol_t tagBlockCol;

			for (int8_t l = 0; l < BLOCK_SIZE + 2 * SEARCH_DISTANCE; l++)
			{
				refBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out1[l];
				tagBlockCol.range(BITS_PER_PIXEL * l + BITS_PER_PIXEL - 1, BITS_PER_PIXEL * l) = out2[l];
			}

			miniSADSumSW(out1, out2, xOffSet, &miniSumSWRet, &OFRetSWRet);
			//		testMiniSADSumWrapperSW(refBlockColData, tagBlockColData, eventCnt, miniSumSW, OFRetSW);

			if (refBlockCol != 0 && tagBlockCol == 0)
			{
				cout << "Should not stop here, it is only a debug breakpoint." << endl;
			}
			cout  << "refBlockColSW is: " << hex <<  refBlockCol << endl;
			cout  << "tagBlockColSW is: " << hex <<  tagBlockCol << endl;
//			*refData++ = refBlockCol;
//			*tagData++ = tagBlockCol;
		}

		apUint17_t tmp1 = apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (1 << 16));
		ap_int<9> tmp2 = miniSumSWRet.range(8, 0);
		apUint6_t tmpOF = OFRetSWRet;
		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
//		std :: cout << "tmp1 is "  << std::hex << tmp1 << std :: endl;
//		std :: cout << "tmp2 is "  << std::hex << tmp2 << std :: endl;
//		std :: cout << "output is "  << std::hex << output << std :: endl;
//		std :: cout << "eventSlice is "  << std::hex << output.to_int() << std :: endl;
		*eventSlice++ = output.to_int();
	}


	for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
	}
}

static uint16_t areaEventRegsSW[AREA_NUMBER][AREA_NUMBER];
static uint16_t areaEventThrSW = 1000;
static uint16_t OFRetRegsSW[2 * SEARCH_DISTANCE + 1][2 * SEARCH_DISTANCE + 1];

void parseEventsSW(uint64_t * dataStream, int32_t eventsArraySize, int32_t *eventSlice)
{
//	glPLActiveSliceIdxSW--;
//	sliceIdx_t idx = glPLActiveSliceIdxSW;

	for(int32_t i = 0; i < eventsArraySize; i++)
	{
        cout << "Current Event packet's event number is: " << eventsArraySize << endl;
		uint64_t tmp = *dataStream++;
		ap_uint<8> xWr, yWr;
		xWr = ((tmp) >> POLARITY_X_ADDR_SHIFT) & POLARITY_X_ADDR_MASK;
		yWr = ((tmp) >> POLARITY_Y_ADDR_SHIFT) & POLARITY_Y_ADDR_MASK;
		bool pol  = ((tmp) >> POLARITY_SHIFT) & POLARITY_MASK;
		int64_t ts = tmp >> 32;

		ap_int<16> miniRet;
		ap_uint<6> OFRet;

        uint16_t c = areaEventRegsSW[xWr/AREA_SIZE][yWr/AREA_SIZE];
        c = c + 1;
        areaEventRegsSW[xWr/AREA_SIZE][yWr/AREA_SIZE] = c;

        // The area threshold reached, rotate the slice index and clear the areaEventRegs.
        if (c > areaEventThrSW)
        {
            glPLActiveSliceIdxSW--;
//            idx = glPLActiveSliceIdxSW;

            for(int r = 0; r < 1000; r++)
            {
                cout << "Rotated successfully!!!!" << endl;
                cout << "x is: " << xWr << "\t y is: " << yWr << "\t idx is: " << glPLActiveSliceIdxSW << endl;
            }

            // Check the accumulation slice is clear or not
            for(int32_t xAddr = 0; xAddr < SLICE_WIDTH; xAddr++)
            {
                for(int32_t yAddr = 0; yAddr < SLICE_HEIGHT; yAddr = yAddr + COMBINED_PIXELS)
                {
                    if (slicesSW[glPLActiveSliceIdxSW][xAddr][yAddr/COMBINED_PIXELS] != 0)
                    {
                        for(int r = 0; r < 1000; r++)
                        {
                            cout << "Ha! I caught you, the pixel which is not clear!" << endl;
                            cout << "x is: " << xAddr << "\t y is: " << yAddr << "\t idx is: " << glPLActiveSliceIdxSW << endl;
                        }
                    }
                }
            }

            for(int areaX = 0; areaX < AREA_NUMBER; areaX++)
            {
                for(int areaY = 0; areaY < AREA_NUMBER; areaY++)
                {
                    areaEventRegsSW[areaX][areaY] = 0;
                }
            }

           for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
           {
               resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdxSW + 3));
               resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdxSW + 3));
           }
        }


		writePixSW(xWr, yWr, glPLActiveSliceIdxSW);

		resetPixSW(i/(PIXS_PER_COL), (i % (PIXS_PER_COL)) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdxSW + 3));
//				resetPix(i/PIXS_PER_COL, (i % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(idx + 3));
//				resetPix(i, 64, (sliceIdx_t)(idx + 3));
//				resetPix(i, 96, (sliceIdx_t)(idx + 3));

//				resetPix(i, 128, (sliceIdx_t)(idx + 3));
//				resetPix(i, 160, (sliceIdx_t)(idx + 3));
//				resetPix(i, 192, (sliceIdx_t)(idx + 3));
//				resetPix(i, 224, (sliceIdx_t)(idx + 3));

		for(int idx1 = 0; idx1 < BLOCK_SIZE; idx1++)
		{
			for(int idx2 = 0; idx2 < BLOCK_SIZE; idx2++)
			{
				localSumReg[idx1][idx2] = 0;
			}
		}
		miniRetVal = 0x7fff;
		minOFRet = ap_uint<6>(0xff);   // 0xff means the OF is invalid.

		// In software version, we initial miniSumTmp for every input, so we don't do it here.
//		initMiniSumLoop : for(int8_t j = 0; j <= 2*SEARCH_DISTANCE; j++)
//		{
//			miniSumTmp[j] = ap_int<16>(0);
//		}

		for(int8_t xOffSet = 0; xOffSet < BLOCK_SIZE + 2 * SEARCH_DISTANCE; xOffSet++)
		{

			pix_t out1[BLOCK_SIZE + 2 * SEARCH_DISTANCE];
			pix_t out2[BLOCK_SIZE + 2 * SEARCH_DISTANCE];


			readBlockColsSW(xWr + xOffSet, yWr , (glPLActiveSliceIdxSW + 1), (glPLActiveSliceIdxSW + 2), out1, out2);

			miniSADSumSW(out1, out2, xOffSet, &miniRet, &OFRet);   // Here k starts from 1 not 0.

		}

		apUint17_t tmp1 = apUint17_t(xWr.to_int() + (yWr.to_int() << 8) + (pol << 16));
		ap_int<9> tmp2 = miniRet.range(8, 0);
		apUint6_t tmpOF = OFRet;
		ap_uint<32> output = (tmp2, (tmpOF, tmp1));
		*eventSlice++ = output.to_int();

        /* -----------------Feedback part------------------------ */
        uint16_t OFRetHistCnt = OFRetRegsSW[OFRet.range(2, 0)][OFRet.range(3, 0)];
        OFRetHistCnt = OFRetHistCnt + 1;
        OFRetRegsSW[OFRet.range(2, 0)][OFRet.range(5, 3)] = OFRetHistCnt;

        uint16_t countSum = 0;
        uint32_t radiusSum =  0;
        for(int8_t OFRetHistX = -SEARCH_DISTANCE; OFRetHistX <= SEARCH_DISTANCE; OFRetHistX++)
        {
            for(int8_t OFRetHistY = -SEARCH_DISTANCE; OFRetHistY <= SEARCH_DISTANCE; OFRetHistY++)
            {
                uint16_t count = OFRetRegsSW[OFRetHistX][OFRetHistY];
                uint16_t radius = pow(OFRetHistX,  2) + pow(OFRetHistY,  2);
                countSum += count;
                radiusSum += radius * count;
            }
        }

	}

	resetLoop: for (int16_t resetCnt = 0; resetCnt < 2048; resetCnt = resetCnt + 2)
	{
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdxSW + 3));
		resetPixSW(resetCnt/PIXS_PER_COL, (resetCnt % PIXS_PER_COL + 1) * COMBINED_PIXELS, (sliceIdx_t)(glPLActiveSliceIdxSW + 3));
	}
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
int abmof(std::shared_ptr<const libcaer::events::PolarityEventPacket> polarityPkt, char *serverIPIP, int socketPort, int eventThreshold, int socketType, std::string filename, std::ofstream &resultStream)
{
	if (!initSocketFlg)
	{
		serverIP = serverIPIP;
		socketPort = 8991;

		if (socketType == 0)     //0 : UDP
		{
			retSocket = init_socket_UDP(4097);
		}
		else
		{
			retSocket = init_socket_TCP(4097);
		}
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

	int32_t eventsArraySize = (*polarityPkt).getEventNumber();
	int32_t eventPerSize = (*polarityPkt).getEventSize();

    // Make suer sds_alloc allocate a right memory for eventSlice.
	if(eventSlice == NULL)
	{
		eventSlice = (uint32_t *)sds_alloc(DVS_HEIGHT * DVS_WIDTH);
		return retSocket;
	}

//    eventsArraySize = 3000;
//    eventPerSize = 8;

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

    sw_ctr.start();
    int32_t eventSliceSW[DVS_HEIGHT * DVS_WIDTH];
//    parseEventsSW(data, eventsArraySize, eventSliceSW);
    sw_ctr.stop();

    // reset the eventSlice
    memset((char *) eventSlice, 0, DVS_HEIGHT * DVS_WIDTH);

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
