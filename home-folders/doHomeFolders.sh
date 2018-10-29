sed -i -e "s@XDG_TEMPLATES_DIR@# XDG_TEMPLATES_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_PUBLICSHARE_DIR@# XDG_PUBLICSHARE_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_DOCUMENTS_DIR@# XDG_DOCUMENTS_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_MUSIC_DIR@# XDG_MUSIC_DIR/@g" ~/.config/user-dirs.dirs
sed -i -e "s@XDG_VIDEOS_DIR@# XDG_VIDEOS_DIR/@g" ~/.config/user-dirs.dirs

echo "enabled=false" > ~/.config/user-dirs.conf
rmdir ~/Templates/
rmdir ~/Public/
rmdir ~/Documents/
rmdir ~/Music/
rmdir ~/Videos/

xdg-user-dirs-update