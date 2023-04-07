#!/bin/bash
# Usage: changeVolume.sh /tmp/wob-volume +2% 

[ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ] && echo 0 > $1 || ( pactl set-sink-volume @DEFAULT_SINK@ $2 && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk '{print substr($5, 1, length($5)-1)}' > $1 )

notify-send "prueba"
