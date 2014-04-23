#include "gb_common.h"

#include <stdio.h>
#include <time.h>
#include <sys/time.h>

#define CHANNEL_1 25
#define CHANNEL_2 24

void setup_gpio()
{
  INP_GPIO(CHANNEL_1);
  INP_GPIO(CHANNEL_2);
}

int get_value(int channel)
{
  return (GPIO_IN0 >> channel) & 0x01;
}

int timeval_substract(struct timeval *result, struct timeval *from, struct timeval *to)
{
  if (to->tv_usec < from->tv_usec) {
    result->tv_usec = 100000 - (from->tv_usec - to->tv_usec);
    result->tv_sec = to->tv_sec - from->tv_sec - 1;
  } else {
    result->tv_usec = to->tv_usec - from->tv_usec;
    result->tv_sec = to->tv_sec - from->tv_sec;
  }
  return 0;
}

int main(void)
{
  struct timeval start, elapsed, tmp;
  // Set sampling period
  struct timespec sp;
  sp.tv_sec = 1;
  sp.tv_nsec = 0L;

  // Map the I/O sections
  setup_io();

  // Set GPIO pins 24 and 25 to the required mode
  setup_gpio();

  // Set reference starting time
  gettimeofday(&start, NULL);
   
  while (1) {
    // Get elapsed time
    gettimeofday(&tmp, NULL);
    timeval_substract(&elapsed, &start, &tmp);

    // Read inputs and print out the readings
    printf("%ld.%06ld,%d,%d\n", elapsed.tv_sec, elapsed.tv_usec, get_value(CHANNEL_1), get_value(CHANNEL_2));
    nanosleep(&sp, NULL);
  }
    
  // Unmap GPIO
  restore_io();

  return 0;
}
