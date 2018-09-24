#!/usr/bin/python3

from os import environ, listdir;
from shutil import copyfile as cp;

cp('i3/', home+'/.config/i3/')
cp('.bin/', home+'/.bin')

cp('.vimrc', home+'/.vimrc')
cp('.bashrc', home+'/.bashrc')

cp('.Xresources', home+'/.Xresources')






