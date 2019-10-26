#!/usr/bin/env bash

# dwn_location=/tmp/flameshot
# current_location=$(pwd)

# git clone https://github.com/lupoDharkael/flameshot $dwn_location

# sudo apt --assume-yes -qq install g++ build-essential qt5-default qt5-qmake qttools5-dev-tools libqt5dbus5 libqt5network5 libqt5core5a libqt5widgets5 libqt5gui5 libqt5svg5-dev

# cd $dwn_location
# sudo make
# mkdir build
# cd build
# qmake ../
# make

# sudo make install

# cd $current_location

sudo apt --assume-yes install flameshot

mkdir -p ~/.config/Dharkael

cp tasks/programs/flameshot/templates/flameshot.conf ~/.config/Dharkael/flameshot.ini