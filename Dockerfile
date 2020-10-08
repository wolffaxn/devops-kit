FROM python:3.9-slim

ARG BUILD_DATE

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.10.0}
ARG ANSIBLE_LINT_VERSION
ENV ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION:-4.3.5}
ARG PACKER_VERSION
ENV PACKER_VERSION=${PACKER_VERSION:-1.6.4}
ARG TERRAFORM_VERSION
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION:-0.13.4}
ARG TFLINT_VERSION
ENV TFLINT_VERSION=${TFLINT_VERSION:-0.20.2}

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE}

# dependencies
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  curl \
  locales \
  unzip \
  && rm -Rf /var/lib/apt/lists/* \
  && apt-get clean

# ansible
RUN set -ex \
  && locale-gen en_US.UTF-8 \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT_VERSION} \
  && mkdir -p /etc/ansible \
  && echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

# packer
RUN set -ex \
  && curl -Lso /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
  && unzip /tmp/packer.zip -d /usr/bin \
  && rm -rf /tmp/*

# terraform
RUN set -ex \
  && curl -Lso /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip /tmp/terraform.zip -d /usr/bin \
  && rm -rf /tmp/*

# tflint
RUN set -ex \
  && curl -Lso /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip \
  && unzip /tmp/tflint.zip -d /usr/bin \
  && rm -rf /tmp/*

#CMD ["ansible", "--version"]
#CMD ["ansible-playbook", "--version"]
#CMD ["ansible-lint", "--version"]
#CMD ["packer", "version"]
#CMD ["terraform", "version"]
#CMD ["tflint", "-v"]
