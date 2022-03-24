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
# Add to authorized_keys
sudo cat 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuGtCRzteoXPCbmG9cQWN+9PZqj5VQsV3JQSwX2I4LLbfXzrkRqXucCrUv7gn/8yV8bDNqCgwcWRS70CFaP7TGYDn4JL5t2K8zQvI6nLcb/8A+RxNRi3XOLSSmxhNNtAM5yFH+TxXCv0JOiaxzhubtNT456A1YmJETr1yH7srgWDhptecusofkkTiWPda1iOrrxFwV4dmHQJRykB/z+4VH2X98uC39eR4sX0soe59TUQqw08Z3pv9P9s0mu7ZMFYnbxJ+lapocm629p25ajiC5ryUfuhhDUA7wSJdukjsEO6C65MPMaqB2GHprGwvp5T1xF/vWw6reBHDr5iplBcOcWiwD+4k2Yvx8ptvAw/3FcEyfJQfdMf03Lo5AwTFoNygWZUoCf9bL85ZCvdubyOHiRVTEjEm6ZcKNGJZCunCCjQfT4tHVbnz0jwP6B6Qvqpu0i5WpDtieLd0NdwCB5eNQ1uXSs8cVTylNlwEYKwDptj+fgfkkJnu3zvrQjVIGYM8=' >> authorized_keys

sudo ufw enable
