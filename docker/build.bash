#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

cd "$(dirname $0)/.."

MDBOOK_VERSION=${MDBOOK_VERSION:-v0.4.40}

source ./docker/autolinks.bash

fix_headers() {
	local file=$1

	sed -i 's/^#/##/' "${file}"
}

add_main_header() {
	local file=$1
	local header=$2

	sed -i "1i # ${header}" "${file}"
}

install_lava() {
	local dir=$1

	local arch=''
	case $(uname -m) in
		i386|i686) arch='386' ;;
		x86_64) arch='amd64' ;;
		arm) arch='armv6' ;;
		aarch64|arm64) arch='arm64' ;;
		*)
			echo "unsupported arch: $(uname -m)" >&2
			return 1
			;;
	esac

	local url="https://github.com/adevinta/lava/releases/latest/download/lava_linux_${arch}.tar.gz"
	curl -LsSf "${url}" | tar -xz -C "${dir}" lava 2> /dev/null
}

install_mdbook() {
	local dir=$1

	local target=''
	case $(uname -m) in
		x86_64) target='x86_64-unknown-linux-musl' ;;
		aarch64|arm64) target='aarch64-unknown-linux-musl' ;;
		*)
			echo "unsupported arch: $(uname -m)" >&2
			return 1
			;;
	esac

	local url="https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-${target}.tar.gz"
	curl -LsSf "${url}" | tar -xz -C "${dir}" mdbook 2> /dev/null
	chmod +x "${dir}/mdbook"
}

install_dir=$(mktemp -d)

install_lava "${install_dir}"
install_mdbook "${install_dir}"

rm -rf build && cp -R src build

cat pages.json | jq --compact-output '.[]' | while read -r row; do
	_jq() {
		echo "${row}" | jq --raw-output "${1}"
	}
	topic=$(_jq '.topic')
	file=$(_jq '.file')
	header=$(_jq '.header')

	mkdir -p "$(dirname "${file}")"
	"${install_dir}/lava" help "${topic}" > "${file}"
	fix_headers "${file}"
	fix_autolinks "${file}"
	add_main_header "${file}" "${header}"
done

version=$("${install_dir}/lava" version)
echo "[${version}](latest.md)" >> build/SUMMARY.md

"${install_dir}/mdbook" build
