FROM python:3.8-alpine

ARG BUILD_DATE

ENV ANSIBLE_VERSION 2.10.0

# Metadata
LABEL maintainer="Alexander Wolff <wolffaxn@gmail.com>" \
  org.label-schema.build-date=${BUILD_DATE}

RUN set -xe \
  && apk --update add --no-cache --virtual .build-dependencies build-base libffi-dev openssl-dev python3-dev \
  && pip3 install --no-cache --upgrade pip \
  && pip3 install --no-cache --upgrade ansible==${ANSIBLE_VERSION} \
  && apk del --purge .build-dependencies \
  && mkdir -p /etc/ansible \
  && echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts \
  && rm -rf /var/cache/apk/* /tmp/*

CMD ["ansible", "--version"]
