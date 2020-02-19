#!/bin/bash

apt-get update
apt-get install maven -y
apt-get install default-jdk wget -y
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce -y
apt-get install phython python2.7 -y 



#apt install -y php php-fpm nginx
#systemctl restart php7.0-fpm.service
#systemctl restart nginx.service
#mkdir /var/www/frontend/
#cp frontend.conf /etc/nginx/conf.d/frontend.conf
#rm /etc/nginx/sites-available/default
#rm /etc/nginx/sites-enabled/default
#rm /etc/nginx/conf.d/default
#cp -a ./ /var/www/frontend/
#nginx -s reload
