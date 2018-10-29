sudo apt --assume-yes install vim git htop chromium-browser default-jdk default-jre curl python-pip ansible exfat-fuse exfat-utils

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