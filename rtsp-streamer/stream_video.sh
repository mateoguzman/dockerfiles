#!/bin/bash

# try to kill previous running server if any.
pkill ffserver

VIDEO_SRC="./video/video.mp4"

ffserver -f ffserver.conf &

ffmpeg -re -f lavfi -i "movie=${VIDEO_SRC}:loop=0,setpts=N/(FRAME_RATE*TB)" http://127.0.0.1:8090/feed1.ffm

