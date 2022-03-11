#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
rm nodesource_setup.sh

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install yarn

sudo apt install nginx
sudo ufw allow 22
sudo ufw allow 'Nginx HTTPS'

sudo ufw enable