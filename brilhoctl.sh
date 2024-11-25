#!/bin/sh
file_brightness=/sys/class/backlight/amdgpu_bl1/brightness
max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
actual_brightness=$(cat /sys/class/backlight/amdgpu_bl1/brightness)
def_value=10

valid_brightness() {
    if [ $1 -ge $max_brightness ] || [ $1 -le 0 ]; then
        echo "FALSE"
    else
        echo "TRUE"
    fi
}

case $1 in
	-help|--help|help)
		echo "These are common commands used in various situations:"
        echo 
        echo "Uso:"
        echo "  brilhoctl COMMAND"
        echo
        echo "Commands:"
		echo "  help            Shows this information"
		echo "  up              Increase brightness"
		echo "  down            Decrease brightness"
        echo 
        echo "brilhoctl COMMAND --help to get help on each command"
        echo
		exit 0
		;;
	-up|--up|up)
        if [ $(valid_brightness $(expr $actual_brightness + $def_value)) == "FALSE" ]; then
            exit 0
        fi
        echo $(expr $actual_brightness + $def_value) > $file_brightness
        exit 0
		;;
	-down|--down|down)
        if [ $(valid_brightness $(expr $actual_brightness - $def_value)) == "FALSE" ]; then
            exit 0
        fi
        echo $(expr $actual_brightness - $def_value) > $file_brightness
		exit 0
		;;
	*)
		echo "Unknown option, Try --help for more information."
		exit 0
		;;
esac
