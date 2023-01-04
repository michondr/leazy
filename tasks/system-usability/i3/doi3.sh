#!/usr/bin/env bash
# all of i3 crap that is needed

sudo apt --assume-yes install i3 i3blocks arandr autorandr rofi compton fonts-font-awesome feh flameshot playerctl

cp tasks/system-usability/i3/config/* ~/.config/i3

# should be enough to logout via `gnome-session-quit` and log in to i3
