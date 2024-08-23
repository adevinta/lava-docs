#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

# docker_compose runs docker compose with the specified arguments. It
# returns with error if neither 'docker compose' nor 'docker-compose'
# can be used.
docker_compose() {
	local cmd='docker compose'
	if ! $cmd version &> /dev/null; then
		cmd='docker-compose'
		if ! $cmd version &> /dev/null; then
			echo 'error: could not find docker compose' >&2
			exit 1
		fi
	fi
	$cmd "$@"
}
