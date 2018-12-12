#!/usr/bin/env bash

set -e

docker pull vkill/jumpserver-core:1.4.4-alpine
docker tag vkill/jumpserver-core:1.4.4-alpine vkill/jumpserver-core:latest
docker push vkill/jumpserver-core:latest


docker pull vkill/jumpserver-coco:1.4.4-alpine
docker tag vkill/jumpserver-coco:1.4.4-alpine vkill/jumpserver-coco:latest
docker push vkill/jumpserver-coco:latest


docker pull vkill/jumpserver-luna:1.4.4-alpine
docker tag vkill/jumpserver-luna:1.4.4-alpine vkill/jumpserver-luna:latest
docker push vkill/jumpserver-luna:latest


docker pull vkill/jumpserver-frontend:1.4.4-alpine
docker tag vkill/jumpserver-frontend:1.4.4-alpine vkill/jumpserver-frontend:latest
docker push vkill/jumpserver-frontend:latest
