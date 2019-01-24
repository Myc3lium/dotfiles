#!/bin/bash

current=$HOME/Documents/code/repos/personal/dotfiles

cp $HOME/.vimrc $current/.vimrc
cp $HOME/.gvimrc $current/.gvimrc
cp $HOME/.tmux.conf $current/.tmux.conf
cp $HOME/.inputrc $current/.inputrc
cp $HOME/.pyrc $current/.pyrc

rm -r $current/ranger/
cp -r $HOME/.config/ranger $current/ranger
cp $HOME/.psrc $current/

rm -r $current/i3/
cp -r $HOME/.config/i3 $current/i3/

rm -r $current/.bin
cp -r $HOME/.bin $current/.bin

rm -r $current/.urxvt
cp -r $HOME/.urxvt $current/.urxvt

rm -r $current/.vim/
cp -r $HOME/.vim/ $current/.vim

cp $HOME/.bashrc $current/.bashrc
cp $HOME/.gitconfig $current/.gitconfig

cp $HOME/.xinitrc $current/.xinitrc
cp $HOME/.Xmodmap $current/.Xmodmap

cp $HOME/.Xresources $current/.Xresources
cp $HOME/.cache/wal/colors.Xresources $current/colors.Xresources
cp $HOME/.mozilla/firefox/4ormmscm.default/chrome/userChrome.css  $current/firefox/userChrome.css 
cp $HOME/.mozilla/firefox/4ormmscm.default/chrome/userContent.css $current/firefox/userContent.css 

rm -r $current/.fonts
cp -r $HOME/.fonts $current/.fonts
