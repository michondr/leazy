#!/usr/bin/env bash

# copy the current config to repo
#dconf dump /org/gnome/terminal/ > ~/_michondr/leazy/terminal/gnome-terminal.properties

# apply from repo
cat ~/_michondr/leazy/terminal/gnome-terminal.properties | dconf load /org/gnome/terminal/