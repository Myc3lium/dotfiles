#!/bin/sh

cmus-remote -u
pactl set-sink-mute 0 1


#img="$(awk '/feh/{ printf $NF }' < ~/.fehbg | sed "s/'//g" )"
# case "$img" in
# 	*.png)
# 		convert "$img" -blur 5x2 ~/Pictures/lockscreen.png
# 	   img=~/Pictures/lockscreen.png
# 	   ;;
# 	*)
# 		# dimensions="$(xdpyinfo | awk '/dimensions/{ printf $2 }')"
#         # -resize "$dimensions" -scale 100%
# 		convert "$img" -blur 5x2 ~/Pictures/lockscreen.png
# 		img=~/Pictures/lockscreen.png
# 		;;
# esac
# -n options stops forking, so commands afterwards aren't executed until unlock.
# This is important for pausing music etc.

scrot ~/Pictures/lockscreen.png
convert "$HOME/Pictures/lockscreen.png" -blur 5x2 ~/Pictures/lockscreen.png
i3lock -e -f -d -n -i "$HOME/Pictures/lockscreen.png" -I 8

# scrot   ~/Pictures/lockscreen.png
# convert ~/Pictures/lockscreen.png -blur 5x2 ~/Pictures/lockscreen.png
# i3lock -e -f -d -i ~/Pictures/lockscreen.png ## -n options stops forking, so commands afterwards
                                                ## aren't executed until unlock

## Undo operations
cmus-remote -u
pactl set-sink-mute 0 0

rm ~/Pictures/lockscreen.png
