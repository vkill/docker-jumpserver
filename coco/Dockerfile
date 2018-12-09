FROM python:3.7-alpine

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
  && apk add --no-cache --virtual .rundeps \
    krb5-dev \
    sshpass \
    libffi-dev \
  \
  && wget -O coco.tar.gz "${JUMPSERVER_COCO_DOWNLOAD_URL}" \
  && echo "${JUMPSERVER_COCO_DOWNLOAD_SHA256} *coco.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/coco \
  && tar -xzf coco.tar.gz -C /opt/coco --strip-components=1 \
  && rm coco.tar.gz \
  \
  && pip install -r /opt/coco/requirements/requirements.txt \
  \
  && apk del .builddeps

WORKDIR /opt/coco

COPY config_docker.py /opt/coco/config.py

EXPOSE 2222
EXPOSE 5000

CMD [ "python", "run_server.py" ]
