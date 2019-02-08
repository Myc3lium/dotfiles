#!/bin/bash

scrot ~/Pictures/screen.png

convert -gaussian-blur 4x4 ~/Pictures/screen.png ~/Pictures/screen.png
cmus-remote -u
pactl set-sink-mute 0 1

i3lock --tiling -e -f -d -n -i ~/Pictures/screen.png # ~/Pictures/screen.png ## -n options stops forking, so commands afterwards
                                               		 # aren't executed until unlock. This is important for pausing music etc.

cmus-remote -u
pactl set-sink-mute 0 0
rm ~/Pictures/screen.png
