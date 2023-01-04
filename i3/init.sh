#!/usr/bin/env bash
# all of i3 crap that is needed

sudo apt --assume-yes install i3 i3blocks arandr autorandr rofi compton fonts-font-awesome feh flameshot playerctl

ln -s ~/_michondr/leazy/i3/config/ ~/.config/i3
chmod +x config/scripts/date.sh
chmod +x config/scripts/start_pavucontroll_clear_spotify.sh

# should be enough to logout via `gnome-session-quit` and log in to i3
