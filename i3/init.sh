#!/usr/bin/env bash
# all of i3 crap that is needed

sudo apt --assume-yes install i3 i3blocks arandr autorandr rofi compton fonts-font-awesome feh flameshot playerctl pavucontrol imagemagick-6.q16 scrot

ln -s ~/_michondr/leazy/i3/setup/ ~/.config/i3
chmod +x setup/scripts/start_pavucontroll_clear_spotify.sh
chmod +x setup/scripts/flameshot_screenshot.sh

# should be enough to logout via `gnome-session-quit` and log in to i3

mkdir ~/.config/rofi
echo '@theme "/usr/share/rofi/themes/sidebar.rasi"' > ~/.config/rofi/config.rasi