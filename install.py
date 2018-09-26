#!/usr/bin/python3

from os import environ, listdir;
from shutil import copyfile as cp;

cp('i3/', home+'/.config/i3/')
cp('.bin/', home+'/.bin')
cp('.calcurse', home+'/.calcurse')

cp('.vimrc', home+'/.vimrc')
cp('.bashrc', home+'/.bashrc')
cp('.psrc', home+'/.psrc')

cp('.Xresources', home+'/.Xresources')






