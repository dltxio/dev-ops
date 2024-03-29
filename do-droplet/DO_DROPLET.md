# Digital Ocean Droplet
If you are required to deploy a server manually (for whatever reason), the following are useful utilities and scripts to assist:
- nginx web server
- pm2 process monitor
- ufw firewall

Manually deploy a server, install Ngninx and then use GH actions to deploy your app

## Access to your Digital Ocean droplet
1. Install the Digital Ocean Deploy Bot Private Key into your `~/.ssh` directory on your computer (found in BitWarden)
2. SSH onto the VM e.g. `ssh root@1.2.3.4`

## Install Nginx and frameworks on the droplet
1. SSH onto the VM as per above
2. `git clone https://github.com/dltxio/dev-ops.git && cd dev-ops && ./install.sh`
3. Depending on pm2 or docker preference run `./pm2/install.sh` or `./docker/install.sh` respectively

## Deploy Bot SSH to your GitHub repository
Allows GitHub actions in the CI yaml files to SSH onto your Digital Ocean server/droplet\
In your GitHub repository Settings > Secrets add the following key pairs:

- `DO_DEPLOY_HOST`: The IP or DNS of the VM
- `DO_DEPLOY_USERNAME`: The user name on the VM that will be used in the SSH tunnel (typically `root`)
- `DO_DEPLOY_KEY`: The Digital Ocean Deploy Bot Private Key

In your GitHub repository Settings > Deploy keys add the following public key of the Deploy bot:

```text
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuGtCRzteoXPCbmG9cQWN+9PZqj5VQsV3JQSwX2I4LLbfXzrkRqXucCrUv7gn/8yV8bDNqCgwcWRS70CFaP7TGYDn4JL5t2K8zQvI6nLcb/8A+RxNRi3XOLSSmxhNNtAM5yFH+TxXCv0JOiaxzhubtNT456A1YmJETr1yH7srgWDhptecusofkkTiWPda1iOrrxFwV4dmHQJRykB/z+4VH2X98uC39eR4sX0soe59TUQqw08Z3pv9P9s0mu7ZMFYnbxJ+lapocm629p25ajiC5ryUfuhhDUA7wSJdukjsEO6C65MPMaqB2GHprGwvp5T1xF/vWw6reBHDr5iplBcOcWiwD+4k2Yvx8ptvAw/3FcEyfJQfdMf03Lo5AwTFoNygWZUoCf9bL85ZCvdubyOHiRVTEjEm6ZcKNGJZCunCCjQfT4tHVbnz0jwP6B6Qvqpu0i5WpDtieLd0NdwCB5eNQ1uXSs8cVTylNlwEYKwDptj+fgfkkJnu3zvrQjVIGYM8=
```

## GitHub Actions
Prerequisites:

- The repository secrets mentioned above so that the GH action can SSH into the DO server
- The target DO server must have the Deploy Bot private key listed in `/root/.ssh/authorized_keys` (this should already be the case if a custom DLTx base-image was used to create the DO server). This is so that the server has git credentials required by `appleboy/ssh-action`
- The DO Deploy Bot public key be added to the repo as a Deploy Key. This is so that GH accepts the credentials of the DO server as it performs git commands

### PM2 [uat-ci](./pm2/uat-ci.yaml)
Deploys the `development` branch to Digital Ocean, checks out the code, runs a build, copies some files and starts the server with [pm2](https://pm2.keymetrics.io/)

### Docker [uat-ci](./docker/uat-ci.yaml)
Deploys the `development` branch to Digital Ocean, checks out the code, runs a build, creates the [Docker](https://www.docker.com/) image as per the [Dockerfile](./Dockerfile) and starts the container
