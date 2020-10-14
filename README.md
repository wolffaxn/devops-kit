# devops-kit

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/devops-kit/main.svg)](https://github.com/wolffaxn/devops-kit)

> A Docker image with Ansible, Packer and Terraform installed.

## Build

Run this command to build an image.

```
make
```

To enable BuildKit build set the DOCKER_BUILDKIT=1 environment variable when invoking the docker build command,
such as:

```
export DOCKER_BUILDKIT=1
make
```

## Run

### Run ansible

```
❯ docker run --rm -it wolffaxn/devops-kit ansible --version
ansible 2.10.2
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.9/site-packages/ansible
  executable location = /usr/local/bin/ansible
  python version = 3.9.0 (default, Oct  6 2020, 22:03:51) [GCC 8.3.0]

```

### Run ansible-playbook

```
❯ docker run --rm -it wolffaxn/devops-kit ansible-playbook --version
ansible-playbook 2.10.2
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.9/site-packages/ansible
  executable location = /usr/local/bin/ansible-playbook
  python version = 3.9.0 (default, Oct  6 2020, 22:03:51) [GCC 8.3.0]

```

### Run ansible-lint

```
❯ docker run --rm -it wolffaxn/devops-kit ansible-lint --version
ansible-lint 4.3.5

```

### Run packer

```
❯ docker run --rm -it wolffaxn/devops-kit:0.9.0 packer version
Packer v1.6.4

```

### Run terraform

```
❯ docker run --rm -it wolffaxn/devops-kit:0.9.0 terraform version
Terraform v0.13.4

```

### Run tflint

```
❯ docker run --rm -it wolffaxn/devops-kit:0.9.0 tflint -v
TFLint version 0.20.2

```

## License

Released under the MIT License. See [license](LICENSE.md) for details.
