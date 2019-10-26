#!/usr/bin/env bash

# init
conf_dir=/home/$USER/.config/jetbrains

mkdir -p "$conf_dir"
mkdir -p "$conf_dir/IntelliJIdea"
mkdir -p "$conf_dir/PhpStorm"
mkdir -p "$conf_dir/PyCharm"

sudo cp tasks/programs/jetbrains/templates/jetbrains.runner /etc/profile.d/jetbrains.sh
sudo sed -i -e "s@CONF_DIR@$conf_dir@g" /etc/profile.d/jetbrains.sh

cp tasks/programs/jetbrains/templates/idea.properties $conf_dir/IntelliJIdea/idea.properties
sudo sed -i -e "s@CONF_DIR@$conf_dir/IntelliJIdea@g" $conf_dir/IntelliJIdea/idea.properties

cp tasks/programs/jetbrains/templates/idea.properties $conf_dir/PhpStorm/idea.properties
sudo sed -i -e "s@CONF_DIR@$conf_dir/PhpStorm@g" $conf_dir/PhpStorm/idea.properties

cp tasks/programs/jetbrains/templates/idea.properties $conf_dir/PyCharm/idea.properties
sudo sed -i -e "s@CONF_DIR@$conf_dir/PyCharm@g" $conf_dir/PyCharm/idea.properties

# idea
sudo apt --assume-yes install default-jdk default-jre
sudo snap install intellij-idea-ultimate --classic

# phpstorm
sudo snap install phpstorm --classic

# pycharm
sudo snap install pycharm-professional --classic
