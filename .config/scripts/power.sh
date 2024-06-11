#!/bin/bash
op=$( echo -e " Poweroff\n Reboot\n Lock " | wofi -p "" -G -i --width 105 --height 125 --dmenu --cache-file /dev/null | awk '{print tolower($2)}' )
case $op in 
        poweroff)
                poweroff
                ;;
        reboot)
                reboot
                ;;
        lock)
		hyprlock -q
                ;;
esac
