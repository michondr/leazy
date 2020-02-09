sudo apt install php7.3-dev php7.3-imap php7.3-gd php7.3-intl php7.3-bcmath docker docker-compose

wget -P /tmp http://www.bytereef.org/software/mpdecimal/releases/mpdecimal-2.4.2.tar.gz

cd /tmp
tar xvzf mpdecimal-2.4.2.tar.gz

cd mpdecimal-2.4.2
./configure
make
sudo make install


sudo touch /etc/php/7.3/mods-available/decimal.ini
sudo ln -s /etc/php/7.3/mods-available/decimal.ini /etc/php/7.3/cli/conf.d/30-decimal.ini #cli
sudo ln -s /etc/php/7.3/mods-available/decimal.ini /etc/php/7.3/fpm/conf.d/30-decimal.ini #fpm


#https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html