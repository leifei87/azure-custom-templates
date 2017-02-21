#!/bin/sh

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
pkg install -y nginx
pkg install -y php56

echo 'nginx_enable="YES"' >> /etc/rc.conf
echo 'php_fpm_enable="YES"' >> /etc/rc.conf

cp /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf.bak
cp ./backend_nginx.conf /usr/local/etc/nginx/nginx.conf

cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini
cp /usr/local/etc/php-fpm.conf /usr/local/etc/php-fpm.conf.bak

sed -i -e 's/^listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g' /usr/local/etc/php-fpm.conf
sed -i -e 's/^;listen.owner = www/listen.owner = www/g' /usr/local/etc/php-fpm.conf
sed -i -e 's/^;listen.group = www/listen.group = www/g' /usr/local/etc/php-fpm.conf
sed -i -e 's/^;listen.mode = 0660/listen.mode = 0660/g' /usr/local/etc/php-fpm.conf

echo "<?php" >> /usr/local/www/nginx/index.php
echo 'echo "Hello world!";' >> /usr/local/www/nginx/index.php
echo "?>" >> /usr/local/www/nginx/index.php

service nginx restart
service php-fpm restart