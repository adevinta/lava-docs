#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

cd "$(dirname $0)"

source ./docker/docker.bash

docker_compose build lava-docs-build
docker_compose run --rm -u "$(id -u):$(id -g)" lava-docs-build
