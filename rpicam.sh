#!/bin/bash

raspivid -w 1080 -h 720 -fps 30 -b 2000000 -t 0 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=192.168.0.5 port=6001