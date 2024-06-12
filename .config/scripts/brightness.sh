#!/bin/bash
read level
echo $level|sudo tee /sys/class/backlight/intel_backlight/brightness
