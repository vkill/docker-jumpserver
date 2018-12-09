FROM python:3.6-alpine

ENV JUMPSERVER_VERSION 1.4.4
ENV JUMPSERVER_DOWNLOAD_URL https://github.com/jumpserver/jumpserver/archive/v1.4.4.tar.gz
ENV JUMPSERVER_DOWNLOAD_SHA256 47ee0d12f51086a132b859455694bb9d737c6da56586257aa76c59cb642be811

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
  && pip install -r /opt/jumpserver_core/requirements/requirements.txt \
  \
  && apk del .builddeps

COPY config_example.py /opt/jumpserver_core/config.py

EXPOSE 8080

WORKDIR /opt/jumpserver_core
CMD [ "python", "run_server.py", "all" ]
