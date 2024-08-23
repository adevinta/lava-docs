# Copyright 2024 Adevinta

# substitute_autolinks creates autolinks in the provided file if the
# autolink ends with the provided delimiter.
substitute_autolinks() {
	local file=$1
	local delim=$2

	sed -i -E 's/(^|^[^\t].*?[[:space:]])(https?:\/\/[[:alnum:][:punct:]]+?)('"${delim}"')/\1<\2>\3/gm' "${file}"
}

# fix_autolinks adds < and > delimiters around URLs in the provided
# markdown file. mdbook requires the use of < and > to delimit
# autolinks.
fix_autolinks() {
	local file=$1

	# Search and replace is done in multiple steps to force
	# precedence. Thus, the order of the calls is relevant.
	# For instance,
	#	<https://example.org/path/>.
	# must have precedence over
	#	<https://example.org/path/.>
	substitute_autolinks "$file" '[.,;:]([[:space:]]|$)'
	substitute_autolinks "$file" '([[:space:]]|$)'
}
