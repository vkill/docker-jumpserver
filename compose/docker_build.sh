#!/usr/bin/env bash

set -e

script_path=$(cd $(dirname $0) ; pwd -P)
script_path_root="${script_path}/"

docker build \
  -t vkill/jumpserver-core:1.4.4-alpine \
  -f "${script_path_root}../core/Dockerfile" \
  "${script_path_root}../core"

docker build \
  -t vkill/jumpserver-coco:1.4.4-alpine \
  -f "${script_path_root}../coco/Dockerfile" \
  "${script_path_root}../coco"
