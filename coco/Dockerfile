FROM python:3.6-alpine

MAINTAINER vkill <vkill.net@gmail.com>

ENV JUMPSERVER_COCO_VERSION 1.4.4
ENV JUMPSERVER_COCO_DOWNLOAD_URL https://github.com/jumpserver/coco/archive/1.4.4.tar.gz
ENV JUMPSERVER_COCO_DOWNLOAD_SHA256 4968b647e1ca19540d5ba496200a49e70d4bfa8ec2c027573d915b3cf2f88bd3

RUN set -ex \
  \
  && sed -i 's!dl-cdn.alpinelinux.org!mirrors.aliyun.com!' /etc/apk/repositories \
  && pip config set global.trusted-host mirrors.aliyun.com \
  && pip config set global.index-url http://mirrors.aliyun.com/pypi/simple \
  \
  && apk add --no-cache --virtual .builddeps \
    build-base \
    wget \
  \
  && wget -O jumpserver_coco.tar.gz "${JUMPSERVER_COCO_DOWNLOAD_URL}" \
  && echo "${JUMPSERVER_COCO_DOWNLOAD_SHA256} *jumpserver_coco.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/jumpserver_coco \
  && tar -xzf jumpserver_coco.tar.gz -C /opt/jumpserver_coco --strip-components=1 \
  && rm jumpserver_coco.tar.gz

COPY alpine_requirements.txt /opt/jumpserver_coco/requirements/alpine_requirements.txt

RUN set -ex \
  \
  && apk add --no-cache --virtual .rundeps $(cat /opt/jumpserver_coco/requirements/alpine_requirements.txt) \
  && pip --no-cache-dir install -r /opt/jumpserver_coco/requirements/requirements.txt \
  \
  && apk del .builddeps

COPY conf_docker.py /opt/jumpserver_coco/conf.py

EXPOSE 2222
EXPOSE 5000

WORKDIR /opt/jumpserver_coco
CMD [ "python", "run_server.py" ]
