#!/bin/bash

current="$HOME"/Documents/code/repos/personal/dotfiles

cp "$HOME"/.vimrc "$current"/.vimrc
cp "$HOME"/.gvimrc "$current"/.gvimrc
cp "$HOME"/.tmux.conf "$current"/.tmux.conf
cp "$HOME"/.inputrc "$current"/.inputrc
cp "$HOME"/.pyrc "$current"/.pyrc

rm -r "$current"/ranger/
cp -r "$HOME"/.config/ranger "$current"/ranger

rm -r "$current"/i3/
cp -r "$HOME"/.config/i3 "$current"/i3/

rm -r "$current"/dunst/
cp -r "$HOME"/.config/dunst "$current"/dunst/

rm -r "$current"/.bin
cp -r "$HOME"/.bin "$current"/.bin

rm -r "$current"/.urxvt
cp -r "$HOME"/.urxvt "$current"/.urxvt

rm -rf "$current"/.vim/
cp -r  "$HOME"/.vim/ "$current"/.vim

rm -rf "$current"/bashconf
cp -r  "$HOME"/.config/bash "$current"/bashconf

# Remove nonessential vim files.
pushd "$current"/.vim
rm -r swaps/
rm -r undodir/
rm -r backups/
rm    ./*viminf*
popd


cp "$HOME"/.bashrc "$current"/.bashrc
cp "$HOME"/.config/bash "$current"/.bash-config
cp "$HOME"/.gitconfig "$current"/.gitconfig

cp "$HOME"/.xinitrc "$current"/.xinitrc
cp "$HOME"/.Xmodmap "$current"/.Xmodmap

cp "$HOME"/.Xresources "$current"/.Xresources
cp "$HOME"/.cache/wal/colors.Xresources "$current"/colors.Xresources
cp "$HOME"/.mozilla/firefox/4ormmscm.default/chrome/userChrome.css  "$current"/firefox/userChrome.css 
cp "$HOME"/.mozilla/firefox/4ormmscm.default/chrome/userContent.css "$current"/firefox/userContent.css 

rm -r "$current"/.fonts
cp -r "$HOME"/.fonts "$current"/.fonts
