#!/bin/bash

i3-msg workspace _

scrot ~/Pictures/screen.png

convert ~/Pictures/screen.png -scale 10% -scale 1000% ~/Pictures/screen.png
convert ~/Picture/screen.png ~/.config/i3/lock.png -gravity center -composite -matte ~/Pictures/screen.png
pactl set-sink-mute 0 1

i3lock -e -f -d -n -i ~/Pictures/screen.png ## -n options stops forking, so commands afterwards
                                               ## aren't executed until unlock
pactl set-sink-mute 0 0
rm ~/Pictures/screen.png

i3-msg workspace back_and_forth

