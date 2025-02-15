// -----------------------------------------------------------------------
/*
	uart_test.c

					Sep/20/2020
*/
// -----------------------------------------------------------------------
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <fcntl.h>
#include <termio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <string.h>
#include <sys/select.h>
#include <jpeglib.h>
#include <stdint.h>
#define SERIAL_PORT "/dev/ttyS3"
typedef struct {
	uint8_t *data;   // raw data
	uint32_t width;
	uint32_t height;
	uint32_t ch;     // color channels
} JpegData;


// -----------------------------------------------------------------------
int main(int argc,char *argv[])
{
	int fd;
	int it;
	uint8_t buf[960];
	struct termios tio;
	uint8_t input[460800];
	uint8_t r_ary[307200],g_ary[307200],b_ary[307200];
	printf( "*** start ***\n");
	fprintf(stderr, "*** Sep/30/2020 ***\n");

	for (it = 0; it < sizeof(buf); it++)
		{
		buf[it] = 0;
		}

	int rv; 
	struct timeval timeout;

	timeout.tv_sec = 1;
	timeout.tv_usec = 5000;

	fd_set set;

	if ((fd = open(SERIAL_PORT, O_RDWR)) < 0)
		{
		fprintf(stderr, "open error\n");
		exit(1);
		}

	FD_ZERO(&set);
	FD_SET(fd, &set);

	fprintf(stderr, "*** check *** aaa ***\n");

	bzero(&tio, sizeof(tio));

	/* 115200bps, フロー制御有り, ８ビット，DTR/DSR無効，受信可能 */
	tio.c_cflag = B9600 | CS8 | CLOCAL | CREAD;
	tio.c_iflag =IGNPAR|IGNBRK;
	tio.c_cc[VMIN] = 1;	/* 入力データをバッファしない */
	tcsetattr(fd, TCSANOW, &tio); /* アトリビュートのセット */
	int sum=0;
	uint32_t i,j;


	for( sum=0;sum<460800;it++){
		
		int len = read(fd, buf, sizeof(buf));

		printf("%dread = %d:len%d",sum, it,len);
		sum=len+sum;
		for (i = 0; i<len; i++)
		{
				printf("%4x",buf[i]);
				input[j]=buf[i];
				j++;
		}
		printf("\n");					
	}
  return 0;
}