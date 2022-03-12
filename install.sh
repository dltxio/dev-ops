#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
rm nodesource_setup.sh

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install yarn

sudo apt install nginx
sudo systemctl restart nginx

cp ~/dev-ops/index.nginx-debian.html /var/www/html/index.nginx-debian.html

sudo ufw allow 22
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'

# sudo npm install pm2@latest -g

sudo ufw enable