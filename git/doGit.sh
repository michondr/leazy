#!/usr/bin/env bash
#git clone https://github.com/michondr/gitconfig.git ~/gitconfig

#printf "\n[include]\n\tpath = \"~/gitconfig/gitconfig\"\n" >> ~/.gitconfig

cp roles/home.gitconfig ~/.gitconfig
mkdir -p ~/collabim && 
cp roles/collabim.gitconfig ~/collabim/.gitconfig
touch ~/collabim/parameters_rds.yml