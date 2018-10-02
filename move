#!/bin/bash

current=$HOME/Documents/code/repos/personal/dotfiles

cp $HOME/.vimrc $current/.vimrc
cp $HOME/.tmux.conf $current/.tmux.conf

rm -r $current/ranger/
cp -r $HOME/.config/ranger $current/ranger
cp $HOME/.psrc $current/

rm -r $current/i3/
cp -r $HOME/.config/i3 $current/i3/

rm -r $current/.bin
cp -r $HOME/.bin $current/.bin

cp $HOME/.bashrc $current/.bashrc
cp $HOME/.gitconfig $current/.gitconfig

cp $HOME/.xinitrc $current/.xinitrc
cp $HOME/.Xmodmap $current/.Xmodmap

cp $HOME/.Xresources $current/.Xresources
cp $HOME/.cache/wal/colors.Xresources $current/colors.Xresources

rm -r $current/.fonts
cp -r $HOME/.fonts $current/.fonts
