#!/bin/sh
set -xe
bluetoothctl disconnect 68:59:32:B5:1F:60
bluetoothctl connect 68:59:32:B5:1F:60
