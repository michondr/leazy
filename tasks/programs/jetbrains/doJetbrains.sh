#!/usr/bin/env bash

##
# moving jetbrain config location under ~/.config/
##

# init
user_dir=/home/$USER/_$USER
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

##
# installing jetbrains IDEs
##

# idea
sudo snap install intellij-idea-ultimate --classic

# phpstorm
sudo snap install phpstorm --classic

# pycharm
sudo snap install pycharm-professional --classic


##
# adding speedy shortcuts automatically
##

# clone to user dir
git clone git@github.com:michondr/speedy-shortcuts.git $user_dir

# symlink to jetbrains dir
ln -s $user_dir/speedy-shortcuts $conf_dir

# symlink from jetbrains dir to Phpstorm's config
## TODO: finish symlinks
#ln -s -f $conf_dir/speedy-shortcuts/options/ide.general.xml $conf_dir/PhpStorm/config/options/
#ln -s -f $conf_dir/speedy-shortcuts/options/keymap.xml $conf_dir/PhpStorm/config/options/
#ln -s -f $conf_dir/speedy-shortcuts/options/macros.xml $conf_dir/PhpStorm/config/options/
#ln -s -f $conf_dir/speedy-shortcuts/keymaps/michondrKeymap.xml $conf_dir/PhpStorm/config/keymaps/
#ln -s -f $conf_dir/speedy-shortcuts/tools/External Tools.xml $conf_dir/PhpStorm/config/tools/