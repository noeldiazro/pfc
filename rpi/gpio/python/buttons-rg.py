#!/usr/bin/env python2.7

import RPi.GPIO as GPIO
import time

CHANNEL_1 = 25
CHANNEL_2 = 24

# initialise RPi.GPIO
GPIO.setmode(GPIO.BCM) 
# Set up inputs
GPIO.setup(CHANNEL_1, GPIO.IN)
GPIO.setup(CHANNEL_2, GPIO.IN)

start = time.time()
try:
    while True:
        elapsed = time.time() - start
        print "%.6f,%d,%d" % (elapsed, GPIO.input(CHANNEL_1), GPIO.input(CHANNEL_2))
        time.sleep(1)

except KeyboardInterrupt: # trap a CTRL+C keyboard interrupt
    GPIO.cleanup()        # resets all GPIO ports used by this program
