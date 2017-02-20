#!/bin/sh

frontendvmip1=$1
backendvm1ip=$2
backendvm2ip=$3

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
pkg install -y nginx

echo 'nginx_enable="YES"' >> /etc/rc.conf
echo "$frontendvmip1"
echo "$backendvm1ip"
echo "$backendvm1ip"

cp /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf.bak
cp ./frontend_nginx.conf /usr/local/etc/nginx/nginx.conf
cp ./frontend_proxy.conf /usr/local/etc/nginx/proxy.conf


service nginx restart