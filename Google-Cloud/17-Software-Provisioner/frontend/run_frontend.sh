#!/bin/bash

apt update
apt install -y apache2
systemctl restart apache2.service
cp -a ./index.html /var/www/html/
cp -a ./app.py /var/www/html/
#apt-get install -yq build-essential python-pip rsync
#pip install flask
#python /var/www/html/app.py &> /dev/null
