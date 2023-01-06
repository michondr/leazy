#!/usr/bin/env bash

git clone git@github.com:michondr/speedy-shortcuts.git ~/_michondr/speedy-shortcuts

ln -s ~/_michondr/speedy-shortcuts/michondrKeymap.xml ~/.config/JetBrains/PhpStorm2022.3/keymaps/michondrKeymap.xml
ln -s ~/_michondr/speedy-shortcuts/keymap.xml ~/.config/JetBrains/PhpStorm2022.3/options/keymapFlags.xml
ln -s ~/_michondr/speedy-shortcuts/macros.xml ~/.config/JetBrains/PhpStorm2022.3/options/macros.xml

