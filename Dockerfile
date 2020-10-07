FROM python:3.9.0-alpine

ARG BUILD_DATE

ARG ANSIBLE_VERSION
ENV ANSIBLE_VERSION=${ANSIBLE_VERSION:-2.10.0}
ARG ANSIBLE_LINT_VERSION
ENV ANSIBLE_LINT_VERSION=${ANSIBLE_LINT_VERSION:-4.3.5}

# metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE}

# ansible
RUN set -xe \
  && apk --update add --no-cache --virtual .build-dependencies build-base libffi-dev openssl-dev python3-dev \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade ansible==${ANSIBLE_VERSION} ansible-lint==${ANSIBLE_LINT_VERSION} \
  && apk del --purge .build-dependencies \
  && mkdir -p /etc/ansible \
  && echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts \
  && rm -rf /var/cache/apk/* /tmp/*

CMD ["ansible", "--version"]
