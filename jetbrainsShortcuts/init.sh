#!/usr/bin/env bash

git clone git@github.com:michondr/jetbrains-speedy-shortcuts.git ~/_michondr/jetbrains-speedy-shortcuts

ln -s ~/_michondr/jetbrains-speedy-shortcuts/michondrKeymap.xml ~/.config/JetBrains/PhpStorm2023.2/keymaps/michondrKeymap.xml
ln -s ~/_michondr/jetbrains-speedy-shortcuts/keymap.xml ~/.config/JetBrains/PhpStorm2023.2/options/keymapFlags.xml
ln -s ~/_michondr/jetbrains-speedy-shortcuts/macros.xml ~/.config/JetBrains/PhpStorm2023.2/options/macros.xml

