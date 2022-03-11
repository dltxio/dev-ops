#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
rm nodesource_setup.sh

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install yarn

sudo apt install nginx
sudo systemctl restart nginx

cp index.nginx-debian.html /var/www/html/index.nginx-debian.html

## Nginx config
sed 's/api_dltx_io/test.domain.com/g' nginx/default-api-only
# sudo cp nginx/default-api-only /etc/nginx/sites-available/default
sed -i 's/api_dltx_io/'$1'/g' nginx/default-api-only
sudo cp nginx/default-api-only /etc/nginx/sites-available/default
sudo systemctl reload nginx

sudo ufw allow 22
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'

sudo npm install pm2@latest -g

sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d $1

sudo ufw enable