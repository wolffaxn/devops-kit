FROM python:3.9-slim

ARG BUILD_DATE

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.10.0}
ARG ANSIBLE_LINT_VERSION
ENV ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION:-4.3.5}

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE}

# dependencies
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  locales \
  && rm -Rf /var/lib/apt/lists/* \
  && apt-get clean

# ansible
RUN set -ex \
  && locale-gen en_US.UTF-8 \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT_VERSION} \
  && mkdir -p /etc/ansible \
  && echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

#CMD ["ansible", "--version"]
#CMD ["ansible-playbook", "--version"]
#CMD ["ansible-lint", "--version"]
