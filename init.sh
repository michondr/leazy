#!/usr/bin/env bash

sudo snap install spotify
sudo snap install slack
sudo snap install phpstorm --classic
sudo snap install goland --classic

sudo snap install signal-desktop
sudo apt install golang -y


sh ./git/init.sh
sh ./i3/init.sh
sh ./vim/init.sh
sh ./jetbrainsShortcuts/init.sh
