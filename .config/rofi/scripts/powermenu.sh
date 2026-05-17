#!/bin/env bash
# Options for powermenu
lock="lock"
logout="logout"
shutdown="shutdown"
reboot="reboot"
sleep="sleep"

# Get answer from user via rofi (wayland)
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu -i -p "Power" \
    -theme "~/.config/rofi/powermenu.rasi")

# Do something based on selected option
if [ "$selected_option" == "$lock" ]; then
    hyprlock
elif [ "$selected_option" == "$logout" ]; then
    hyprctl dispatch 'hl.dsp.exit()'
elif [ "$selected_option" == "$shutdown" ]; then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]; then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
    systemctl suspend
else
    echo "No match"
fi
