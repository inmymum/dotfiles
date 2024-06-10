#!/bin/bash
selected=$(echo -e "   Power\n   Reset"|wofi -p "" -G -i --width 105 --height 90 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  power)
    exec systemctl reboot;;
  reset)
    exec systemctl poweroff -i;;
esac
