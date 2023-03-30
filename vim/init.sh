#!/usr/bin/env bash

# install proper vim
sudo apt install vim -y

# symlink the rc file to home
ln -s ~/_michondr/leazy/vim/.vimrc   ~/

# create colors dir and download the darcula theme
mkdir -p ~/.vim/colors/
curl -o ~/.vim/colors/darcula.vim https://raw.githubusercontent.com/doums/darcula/master/colors/darcula.vim
