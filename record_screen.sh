#!/bin/sh

#https://trac.ffmpeg.org/wiki/Capture/Desktop
#ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+100,200 -f pulse -ac 2 -i default output.mkv
#ffplay output.mkv

#screenshot
#ffmpeg -f x11grab -framerate 1 -video_size 1920x1080 -i :0.0 -vframes 1 output.jpeg

#ffmpeg -video_size 1280x720 -framerate 30 -f x11grab -i :0.0+0,0 ~/Downloads/record_output.mkv
#-video_size "$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)x$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)" \
ffmpeg \
    -framerate 25 \
    -f x11grab \
    -i :0.0+0,0 \
    -f alsa -i default \
    -codec:v libx264 \
    -codec:a flac \
    ~/Downloads/record_output_$(date +%F-%I-%M-%N).mkv
