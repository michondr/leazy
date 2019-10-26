#!/usr/bin/env bash

sudo apt --assume-yes install mysql-server

#this component uninstalling probably works. tried to uninstall as much as I could. do it manually if you'll be unable to set root password
sudo mysql -u root -Bse "UNINSTALL COMPONENT 'file://component_validate_password';"
sudo mysql -u root -Bse "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';"
sudo mysql -u root --password=root -Bse "FLUSH PRIVILEGES;"

mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root --password=root mysql