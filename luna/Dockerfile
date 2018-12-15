FROM nginx:1.15-alpine

MAINTAINER vkill <vkill.net@gmail.com>

ENV JUMPSERVER_LUNA_VERSION 1.4.5
ENV JUMPSERVER_LUNA_DOWNLOAD_URL https://github.com/jumpserver/luna/releases/download/1.4.5/luna.tar.gz
ENV JUMPSERVER_LUNA_DOWNLOAD_SHA256 ef24c74ae1515394fad43494d89b0af340f23ea85da0378e4d077cba07024134

RUN set -ex \
  \
  && wget -O jumpserver_luna.tar.gz "${JUMPSERVER_LUNA_DOWNLOAD_URL}" \
  && echo "${JUMPSERVER_LUNA_DOWNLOAD_SHA256} *jumpserver_luna.tar.gz" | sha256sum -c - \
  && mkdir -p /opt/jumpserver_luna \
  && tar -xzf jumpserver_luna.tar.gz -C /opt/jumpserver_luna --strip-components=1 \
  && rm jumpserver_luna.tar.gz

COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
