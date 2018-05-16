#!/usr/bin/python3

from os import environ, listdir;
from shutil import copyfile as cp;

home = environ['HOME']

cp('i3/', home+'/.config/i3/')
cp('tmuxinator/', home+'/.tmuxinator')

for file in listdir('nano'):
    cp('nano/'+file, home+'/'+file)

cp('.vimrc', home+'/.vimrc')
cp('.bashrc', home+'/.bashrc')







