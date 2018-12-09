FROM python:3.7-alpine

ENV JUMPSERVER_VERSION 1.4.4
ENV JUMPSERVER_DOWNLOAD_URL https://github.com/jumpserver/jumpserver/archive/v1.4.4.tar.gz
ENV JUMPSERVER_DOWNLOAD_SHA256 47ee0d12f51086a132b859455694bb9d737c6da56586257aa76c59cb642be811

RUN set -ex \
  \
  && sed -i 's!dl-cdn.alpinelinux.org!mirrors.aliyun.com!' /etc/apk/repositories \
  \
  && apk add --no-cache --virtual .builddeps \
    build-base \
    wget \
  \
  && apk add --no-cache --virtual .rundeps \
    tiff-dev \
    jpeg-dev \
      zlib-dev \
    freetype-dev \
    lcms-dev \
    libwebp-dev \
      tcl-dev \
      tk-dev \
    python3-dev \
    openssl-dev \
    openldap-dev \
    cyrus-sasl-dev \
    krb5-dev \
    sshpass \
    postgresql-dev \
    mariadb-dev \
    sqlite-dev \
  \
  && wget -O jumpserver.tar.gz "${JUMPSERVER_DOWNLOAD_URL}" \
  && echo "${JUMPSERVER_DOWNLOAD_SHA256} *jumpserver.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/jumpserver \
  && tar -xzf jumpserver.tar.gz -C /opt/jumpserver --strip-components=1 \
  && rm jumpserver.tar.gz \
  \
  && pip install -r /opt/jumpserver/requirements/requirements.txt \
  \
  && apk del .builddeps

WORKDIR /opt/jumpserver

EXPOSE 8080

CMD [ "python", "run_server.py", "all" ]
