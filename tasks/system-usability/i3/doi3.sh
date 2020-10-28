#!/usr/bin/env bash
# all of i3 crap that is needed

sudo apt --assume-yes install i3 i3blocks arandr autorandr rofi compton feh scrot

cp tasks/system-usability/i3/config/* ~/.config/i3 -r

# should be enough to logout via `gnome-session-quit` and log in to i3
