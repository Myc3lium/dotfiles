#!/bin/bash

cmus-remote -u
pactl set-sink-mute 0 1

img="$(cat ~/.fehbg | awk '/feh/{ printf $NF }' | sed "s/'/ /g" )"
case "$img" in
	*.png) ;;
	*)
		dimensions="$(xdpyinfo | awk '/dimensions/{ printf $2 }')"
		convert $img -resize $dimensions! ~/Pictures/lockscreen.png
		img=~/Pictures/lockscreen.png
		;;
esac

# -n options stops forking, so commands afterwards aren't executed until unlock.
# This is important for pausing music etc.
i3lock -e -f -d -n -i $img -I 8

## Undo operations
cmus-remote -u
pactl set-sink-mute 0 0

rm ~/Pictures/lockscreen.png
