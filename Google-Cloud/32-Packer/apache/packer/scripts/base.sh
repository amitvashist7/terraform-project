#!/bin/bash

sudo apt-get update
sudo apt-get install apache2 -y 
sudo systemctl start apache2
sudo systemctl enable apache2
sudo touch /var/www/html/index.html
sudo chmod 777 /var/www/html/index.html
sudo echo "<h1>Welcome to Packer based Apache Image</h1>" > /var/www/html/index.html


