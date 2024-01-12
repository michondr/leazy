# Leazy - linux-eazy for lazy people

Set up environment on fresh install:
* [i3wm](https://i3wm.org/) todo: move to sway
* [fish](https://fishshell.com/)
* [gitconfig](https://github.com/michondr/gitconfig) (fork of [porn/gitconfig](https://github.com/porn/gitconfig))
* [jetbrain shorcuts](https://github.com/michondr/jetbrains-speedy-shortcuts) my own doing. I use them for PHPStorm and GOLand
* vimrc
* terminal color

install by:
```shell
cd leazy/
sh init.sh
```
install single part:

```shell
cd leazy/
sh vim/init.sh
```

could I use [yadm](https://yadm.io/)? Yep. maybe later

### manual steps
```
# system-wide dark mode
# firefox dark color while loading sites
~/.config/gtk-3.0/settings.ini

[Settings]
#gtk-theme-name=Arc-Dark
#gtk-icon-theme-name=breeze-dark
gtk-application-prefer-dark-theme=1
```

scaling of UI:
```
echo "Xft.dpi: 150" >> ~/.Xresources
```