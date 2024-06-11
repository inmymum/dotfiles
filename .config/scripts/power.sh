#!/bin/bash
op=$( echo -e " Poweroff\n Reboot\n Lock " | wofi -p "" -G -i --width 105 --height 125 -y 325 -x 605 --dmenu --cache-file /dev/null | awk '{print tolower($2)}' )
case $op in 
        poweroff)
                pkill wofi && poweroff
                ;;
        reboot)
                pkill wofi && reboot
                ;;
        lock)
		pkill wofi && hyprlock -q
                ;;
esac
