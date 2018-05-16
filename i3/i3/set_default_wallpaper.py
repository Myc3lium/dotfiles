#!/usr/bin/python3

from os import environ, system;

HOME = environ['HOME'] + '/'

with open(HOME + '.config/i3/wallpaper', 'r') as f:
    imgname = f.read()
    
system('feh --bg-fill ' + imgname)
