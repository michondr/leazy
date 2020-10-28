#!/usr/bin/env bash

sudo apt --assume-yes install fish

mkdir ~/.config/fish
cp tasks/system-config/fish/templates/* ~/.config/fish/ -r
