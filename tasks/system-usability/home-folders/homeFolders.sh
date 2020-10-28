#!/usr/bin/env bash

sed -i -e "s@XDG_TEMPLATES_DIR@# XDG_TEMPLATES_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_PUBLICSHARE_DIR@# XDG_PUBLICSHARE_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_DOCUMENTS_DIR@# XDG_DOCUMENTS_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_DOWNLOADS_DIR@# XDG_DOWNLOADS_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_MUSIC_DIR@# XDG_MUSIC_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_PICTURES_DIR@# XDG_PICTURES_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_VIDEOS_DIR@# XDG_VIDEOS_DIR/@g" ~/.config/user-dirs.dirs

echo "enabled=false" > ~/.config/user-dirs.conf
rm -rf ~/Templates/
rm -rf ~/Public/
rm -rf ~/Documents/
rm -rf ~/Downloads/
rm -rf ~/Music/
rm -rf ~/Pictures/
rm -rf ~/Videos/

xdg-user-dirs-update