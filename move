#!/bin/bash

current=$HOME/Documents/code/repos/personal/dotfiles

cp $HOME/.vimrc $current/.vimrc
cp $HOME/.tmux.conf $current/.tmux.conf

cp $HOME/.config/ranger/rc.conf $current/

rm -r $current/i3/
cp -r $HOME/.config/i3 $current/i3/

rm -r $current/.bin
cp -r $HOME/.bin $current/.bin

rm -r $current/.calcurse
cp -r $HOME/.calcurse $current/.calcurse

cp $HOME/.bashrc $current/.bashrc
cp $HOME/.gitconfig $current/.gitconfig

cp $HOME/.Xresources $current/.Xresources
cp $HOME/.cache/wal/colors.Xresources $current/colors.Xresources

rm -r $current/.fonts
cp -r $HOME/.fonts $current/.fonts
