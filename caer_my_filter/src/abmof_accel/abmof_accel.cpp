#include "abmof.h"

// xfopencv
#include "xf_headers.h"
#include "xf_dense_npyr_optical_flow_config.h"



// slice_1 is current slice, slice_2 is t-1 slice and slice_3 is t-2 slice.
// TODO, hardcode now, should adapt to the real chip size.
uchar slice_1[DVS_HEIGHT][DVS_WIDTH], slice_2[DVS_HEIGHT][DVS_WIDTH], slice_3[DVS_HEIGHT][DVS_WIDTH];

long imgNum = 0;
bool initSocketFlg = false;
int retSocket;

void *display(void *);


int init_socket(int port)
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
     pthread_create(&thread_id,NULL,display,&remoteSocket);
     sleep(5);

     //pthread_join(thread_id,NULL);

    // }
    //pthread_join(thread_id,NULL);
    //close(remoteSocket);

    return remoteSocket;
}

void *display(void *ptr){
    int socket = *(int *)ptr;
    //OpenCV Code
    //----------------------------------------------------------

    cv::Mat img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, XF_8UC1, slice_1);
     //make it continuous
    if (!img.isContinuous()) {
        img = img.clone();
    }

    int imgSize = img.total() * img.elemSize();
    int bytes = 0;
    int key;


    std::cout << "Image Size:" << imgSize << std::endl;

    while(1) {

            /* get a frame from camera */
    		    img = cv::Mat(DVS_HEIGHT, DVS_WIDTH, XF_8UC1, slice_1);
                //do video processing here
                // cvtColor(img, imgGray, CV_BGR2GRAY);

                //send processed image
                if ((bytes = send(socket, img.data, imgSize, 0)) < 0){
                     std::cerr << "bytes = " << bytes << std::endl;
                     break;
                }
    }

}


void saveImg(char img[DVS_WIDTH][DVS_HEIGHT], long cnt)
{
	cv::Mat frame_out = cv::Mat(DVS_WIDTH, DVS_HEIGHT, XF_8UC1, img);

	char out_string[200];
	sprintf(out_string,"out_%ld.png", cnt);

	cv::imwrite(out_string,frame_out);
}

void reset_slices()
{
	// clear slices
	for (uchar (&row)[240] : slice_1)
	    for (uchar & cell : row)
	        cell *= 0;

	for (uchar (&row)[240] : slice_2)
	    for (uchar & cell : row)
	        cell *= 0;

	for (uchar (&row)[240] : slice_3)
	    for (uchar & cell : row)
	        cell *= 0;
}

void accumulate(uint16_t x, uint16_t y, bool pol, int64_t ts)
{
	if (pol == true)
	{
		slice_1[y][x] += (int)pol;
	}
	else
	{
		slice_1[y][x] -= (int)pol;
	}
}







