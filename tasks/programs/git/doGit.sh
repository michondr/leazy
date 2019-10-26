#!/usr/bin/env bash

gitconfig_folder='~/.config/gitconfig'

rm -rf ${gitconfig_folder}
git clone https://github.com/michondr/gitconfig.git ${gitconfig_folder}

cp tasks/programs/git/templates/home.gitconfig ~/.gitconfig
