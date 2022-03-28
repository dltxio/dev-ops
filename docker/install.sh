#!/bin/bash

## One off install script to setup server on Ubuntu 20.04

cd ~
sudo apt-get update
sudo apt-get upgrade
sudo apt install nginx

cp ~/dev-ops/nginx/sites-available/default /etc/nginx/sites-available/default

sudo systemctl restart nginx

sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d ec.dltx.io

# Add rules to prevent docker from punching a hole through the firewall
cp ~/dev-ops/ufw/after.rules /etc/ufw/after.rules

# Firewall rules
sudo ufw allow 22
sudo ufw allow from 103.1.229.2 to any port 443

sudo apt-get update

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock

# Add to authorized_keys
sudo cat 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuGtCRzteoXPCbmG9cQWN+9PZqj5VQsV3JQSwX2I4LLbfXzrkRqXucCrUv7gn/8yV8bDNqCgwcWRS70CFaP7TGYDn4JL5t2K8zQvI6nLcb/8A+RxNRi3XOLSSmxhNNtAM5yFH+TxXCv0JOiaxzhubtNT456A1YmJETr1yH7srgWDhptecusofkkTiWPda1iOrrxFwV4dmHQJRykB/z+4VH2X98uC39eR4sX0soe59TUQqw08Z3pv9P9s0mu7ZMFYnbxJ+lapocm629p25ajiC5ryUfuhhDUA7wSJdukjsEO6C65MPMaqB2GHprGwvp5T1xF/vWw6reBHDr5iplBcOcWiwD+4k2Yvx8ptvAw/3FcEyfJQfdMf03Lo5AwTFoNygWZUoCf9bL85ZCvdubyOHiRVTEjEm6ZcKNGJZCunCCjQfT4tHVbnz0jwP6B6Qvqpu0i5WpDtieLd0NdwCB5eNQ1uXSs8cVTylNlwEYKwDptj+fgfkkJnu3zvrQjVIGYM8=' >> authorized_keys

sudo systemctl restart ufw
sudo ufw enable
