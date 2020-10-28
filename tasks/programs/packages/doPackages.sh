#!/usr/bin/env bash

sudo apt --assume-yes install vim git htop chromium-browser curl ansible exfat-fuse exfat-utils xclip flameshot awscli nginx net-tools

# java crap
sudo apt --assume-yes install default-jdk default-jre

# python crap
sudo apt --assume-yes install python-pip python-pytest pipenv

# php crap
sudo apt --assume-yes install php7.4-fpm php7.4-cli php7.4-common php7.4-curl php7.4-json php7.4-mysql php7.4-xml php7.4-mbstring php7.4-gd php7.4-df php7.4-pdo-mysql php7.4-dev phpunit


# composer
sudo curl -sS https://getcomposer.org/installer -o ~/composer-setup.php
sudo php ~/composer-setup.php --install-dir=/usr/bin --filename=composer
rm -f ~/composer-setup.php

# supervisor
sudo apt --assume-yes install supervisor
pip install supervisor-wildcards
sudo chmod 777 /etc/supervisor/supervisord.conf
printf "[ctlplugin:wildcards]\nsupervisor.ctl_factory = supervisorwildcards.controllerplugin:make_wildcards_controllerplugin\n" >> /etc/supervisor/supervisord.conf
sudo unlink /var/run/supervisor.sock

# aws fuzzy
pip install aws-fuzzy-finder
