#!/bin/bash

popup_width=$(($(xrandr --listmonitors | grep \+ | awk '{print $3}' | cut -d/ -f1) * 50 / 100))
popup_height=$(($(xrandr --listmonitors | grep \+ | awk '{print $3}' | cut -dx -f2 | cut -d/ -f1) * 60 / 100))


if ! grep -q "popup" <<< "$(i3-msg -t get_tree | grep -o "popup")"; then
    i3-msg "exec --no-startup-id urxvt -name popup"
    sleep 1
else
    i3-msg "[instance=\"popup\"] resize set ${popup_width} ${popup_height}; [instance=\"popup\"] scratchpad show; [instance=\"popup\"] move position center"
fi
