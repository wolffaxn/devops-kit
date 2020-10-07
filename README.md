# devops-kit

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/devops-kit/main.svg)](https://github.com/wolffaxn/devops-kit)

## About

> A Docker image with Ansible, Packer and Terraform installed.

## Build

Run this command to build an image.

```
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t wolffaxn/devops-kit .
```

To enable BuildKit build set the DOCKER_BUILDKIT=1 environment variable when invoking the docker build command,
such as:

```
export DOCKER_BUILDKIT=1
docker build --no-cache=true --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t wolffaxn/devops-kit .
```

## Run

```
docker run --rm -it wolffaxn/devops-kit ansible
docker run --rm -it wolffaxn/devops-kit ansible-playbook
docker run --rm -it wolffaxn/devops-kit ansible-lint
```

## License

Released under the MIT License. See [license](LICENSE.md) for details.
