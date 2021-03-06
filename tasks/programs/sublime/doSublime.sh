#!/usr/bin/env bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
sudo apt --assume-yes -qq update
sudo apt --assume-yes -qq install sublime-text libgtk2.0-0

# set my custom keboard shortcuts
cp tasks/programs/sublime/templates/michondr.sublime-keymap ~/.config/sublime-text-3/Packages/User/Default.sublime-keymap
cp tasks/programs/sublime/templates/preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cp tasks/programs/sublime/templates/close_without_saving.py ~/.config/sublime-text-3/Packages/User/close_without_saving.py

# auto install packages (those are specified in package_control and will be downloaded on first opening of sublime)
cp tasks/programs/sublime/templates/package-control.sublime-settings ~/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings
wget "https://packagecontrol.io/Package%20Control.sublime-package" --directory-prefix ~/.config/sublime-text-3/Installed\ Packages/

# make sublime default text editor
sudo sed -i 's/gedit.desktop/sublime_text/g' /usr/share/applications/defaults.list
