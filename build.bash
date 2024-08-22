#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

cd "$(dirname $0)"

source ./docker/docker.bash

GO_CACHE_DIR="${HOME}/.cache/lava-docs/go-cache"
GO_MOD_CACHE_DIR="${HOME}/.cache/lava-docs/go-mod-cache"

mkdir -p "${GO_CACHE_DIR}" "${GO_MOD_CACHE_DIR}"

VOLUME_FLAGS=(
	'-v' "${GO_CACHE_DIR}:/go-cache"
	'-v' "${GO_MOD_CACHE_DIR}:/go-mod-cache"
)

if [[ -n ${LAVA_PATH:-} ]]; then
	VOLUME_FLAGS+=('-v' "${LAVA_PATH}:/lava")
fi

docker_compose build lava-docs-build
docker_compose run --rm -u "$(id -u):$(id -g)" "${VOLUME_FLAGS[@]}" lava-docs-build
