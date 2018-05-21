#!/usr/bin/python3

from random import randrange;
from os import listdir, environ, system;

HOME = environ['HOME'] + '/'
path = HOME + 'Documents/wallpaper/'

imgs = listdir(path)
imgname = path + imgs[randrange(0, len(imgs))]

if ' ' in imgname:
    imgname = '"{}"'.format(imgname)

with open(HOME + '.config/i3/wallpaper', 'w') as f:
    f.write(imgname)
    
system('feh --bg-fill ' + imgname)

