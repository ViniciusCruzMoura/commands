#!/bin/sh
ffmpeg -video_size 1280x720 -framerate 30 -f x11grab -i :0.0+0,0 ~/Downloads/record_output.mkv
