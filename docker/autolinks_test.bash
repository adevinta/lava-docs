#!/usr/bin/env bash
# Copyright 2024 Adevinta

set -e -u

cd "$(dirname $0)"

source autolinks.bash

test_fix_autolinks() {
	tmpdir=$(mktemp -d)
	cp 'testdata/autolinks.md' "${tmpdir}/autolinks.md"
	fix_autolinks "${tmpdir}/autolinks.md"
	diff -u 'testdata/want_autolinks.md' "${tmpdir}/autolinks.md"
}

test_fix_autolinks
