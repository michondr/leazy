#!/usr/bin/env bash

sudo apt --assume-yes install fish
go install github.com/darkhz/bluetuith@latest

#sudo snap install starship
#starship init fish | source

rm -d ~/.config/fish/functions/
rm -d ~/.config/fish/conf.d/

ln -s ~/_michondr/leazy/fish/functions  ~/.config/fish/
ln -s ~/_michondr/leazy/fish/conf.d     ~/.config/fish/