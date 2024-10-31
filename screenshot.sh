#!/bin/sh
set -xe
#sleep 2; scrot -s /tmp/screenshot.png && firefox --new-window /tmp/screenshot.png
sleep 2; scrot -s /tmp/screenshot.png && firefox --new-window /tmp/screenshot.png && sleep 2; rm /tmp/screenshot.png
#sleep 2; scrot -s /tmp/screenshot.png && xclip -selection clipboard -t image/png -i /tmp/screenshot.png
