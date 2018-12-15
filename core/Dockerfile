FROM python:3.6-alpine

MAINTAINER vkill <vkill.net@gmail.com>

ENV JUMPSERVER_VERSION 1.4.5
ENV JUMPSERVER_DOWNLOAD_URL https://github.com/jumpserver/jumpserver/archive/1.4.5.tar.gz
ENV JUMPSERVER_DOWNLOAD_SHA256 d543a64b1fa9e5f2d9d20ad0af826b0aeba02a920a9262341246fccfc43f2639

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
  && wget -O jumpserver_core.tar.gz "${JUMPSERVER_DOWNLOAD_URL}" \
  && echo "${JUMPSERVER_DOWNLOAD_SHA256} *jumpserver_core.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/jumpserver_core \
  && tar -xzf jumpserver_core.tar.gz -C /opt/jumpserver_core --strip-components=1 \
  && rm jumpserver_core.tar.gz

COPY alpine_requirements.txt /opt/jumpserver_core/requirements/alpine_requirements.txt

RUN set -ex \
  \
  && apk add --no-cache --virtual .rundeps $(cat /opt/jumpserver_core/requirements/alpine_requirements.txt) \
  && pip --no-cache-dir install -r /opt/jumpserver_core/requirements/requirements.txt \
  && pip --no-cache-dir install psycopg2 \
  \
  && apk del .builddeps

EXPOSE 8080

WORKDIR /opt/jumpserver_core
CMD [ "python", "run_server.py", "all" ]
