#! /bin/sh
# Reset the keyboard driver and USB mouse 
        
#modprobe -r atkbd
#modprobe atkbd reset=1
echo "Finished resetting the keyboard."
        
# Reset every USB device, because we don't know in advance which port
# the mouse is plugged into. Send errors to /dev/null to avoid 
# cluttering up the logs.
for USB in /sys/bus/usb/devices/*/authorized; do
    eval "echo 0 > $USB" 2>/dev/null 
    eval "echo 1 > $USB" 2>/dev/null
done
echo "Finished resetting USB inputs."
