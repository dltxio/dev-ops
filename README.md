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

```text
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuGtCRzteoXPCbmG9cQWN+9PZqj5VQsV3JQSwX2I4LLbfXzrkRqXucCrUv7gn/8yV8bDNqCgwcWRS70CFaP7TGYDn4JL5t2K8zQvI6nLcb/8A+RxNRi3XOLSSmxhNNtAM5yFH+TxXCv0JOiaxzhubtNT456A1YmJETr1yH7srgWDhptecusofkkTiWPda1iOrrxFwV4dmHQJRykB/z+4VH2X98uC39eR4sX0soe59TUQqw08Z3pv9P9s0mu7ZMFYnbxJ+lapocm629p25ajiC5ryUfuhhDUA7wSJdukjsEO6C65MPMaqB2GHprGwvp5T1xF/vWw6reBHDr5iplBcOcWiwD+4k2Yvx8ptvAw/3FcEyfJQfdMf03Lo5AwTFoNygWZUoCf9bL85ZCvdubyOHiRVTEjEm6ZcKNGJZCunCCjQfT4tHVbnz0jwP6B6Qvqpu0i5WpDtieLd0NdwCB5eNQ1uXSs8cVTylNlwEYKwDptj+fgfkkJnu3zvrQjVIGYM8=
```
