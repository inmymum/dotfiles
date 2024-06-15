#!/bin/bash
if [[ -z "$1" || "$1" != "get" ]]; then
 echo "$(($(cat /sys/class/backlight/intel_backlight/brightness)+$1))"|sudo tee /sys/class/backlight/intel_backlight/brightness>/dev/null
else 
 cat /sys/class/backlight/intel_backlight/brightness
fi
