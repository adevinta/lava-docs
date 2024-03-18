#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

cd "$(dirname $0)"

MDBOOK_VERSION=${MDBOOK_VERSION:-v0.4.37}

fix_headers() {
	local file=$1

	sed -i "s/^#/##/" "${file}"
}

add_main_header() {
	local file=$1
	local header=$2

	sed -i "1i # ${header}" "${file}"
}

install_lava() {
	local dir=$1
	local url='https://github.com/adevinta/lava/releases/latest/download/lava_linux_amd64.tar.gz'

	curl -LsSf "${url}" | tar -xz -C "${dir}" lava 2> /dev/null
}

install_mdbook() {
	local dir=$1
	local url="https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-gnu.tar.gz"

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
	add_main_header "${file}" "${header}"
done

version=$("${install_dir}/lava" version)
echo "[${version}](latest.md)" >> build/SUMMARY.md

"${install_dir}/mdbook" build
