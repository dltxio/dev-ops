# dev-ops
Install Ngninx and GH actions

## Install Ngninx and frameworks

* SSH onto the VM
* `git clone https://github.com/dltxio/dev-ops.git && cd dev-ops && ./install.sh`

## Deploy bot SSH PubKey

GitHub secrets add the following key pairs.  SSH private key can be found in bitwarden as "Digital Ocean Deploy Bot Private Key".

* DO_DEPLOY_HOST
* DO_DEPLOY_USERNAME
* DO_DEPLOY_KEY

DO_DEPLOY_HOST:  The IP or DNS of the VM  
DO_DEPLOY_USERNAME:  The user name on the VM that will be used in the SSH tunnel  
DO_DEPLOY_KEY: The SSH private key  

```text
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuGtCRzteoXPCbmG9cQWN+9PZqj5VQsV3JQSwX2I4LLbfXzrkRqXucCrUv7gn/8yV8bDNqCgwcWRS70CFaP7TGYDn4JL5t2K8zQvI6nLcb/8A+RxNRi3XOLSSmxhNNtAM5yFH+TxXCv0JOiaxzhubtNT456A1YmJETr1yH7srgWDhptecusofkkTiWPda1iOrrxFwV4dmHQJRykB/z+4VH2X98uC39eR4sX0soe59TUQqw08Z3pv9P9s0mu7ZMFYnbxJ+lapocm629p25ajiC5ryUfuhhDUA7wSJdukjsEO6C65MPMaqB2GHprGwvp5T1xF/vWw6reBHDr5iplBcOcWiwD+4k2Yvx8ptvAw/3FcEyfJQfdMf03Lo5AwTFoNygWZUoCf9bL85ZCvdubyOHiRVTEjEm6ZcKNGJZCunCCjQfT4tHVbnz0jwP6B6Qvqpu0i5WpDtieLd0NdwCB5eNQ1uXSs8cVTylNlwEYKwDptj+fgfkkJnu3zvrQjVIGYM8=
```

## GitHub Actions
### [uat-ci](./uat-ci.yaml)
Deploys the `develop` branch to Digital Ocean, checks out the code, runs a build, copies some files and starts the server with [pm2](https://pm2.keymetrics.io/)

Prerequisites:
- The repository secrets mentioned above so that the GH action can SSH into the DO server
- The target DO server must have the the DO Deploy Bot private key listed in `/root/.ssh/authorized_keys` (this should already be the case if a custom DLTx base-image was used to create the DO server). This is so that the server has git credentials required by `appleboy/ssh-action`
- The DO Deploy Bot public key be added to the repo as a Deploy Key. This is so that GH accepts the credentials of the DO server as it performs git commands
