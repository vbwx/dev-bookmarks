#!/bin/bash

# Install dependencies
command -v marked > /dev/null || npm install -g marked

cat *.md | marked -o body.html
cat <<- EOF > WebDev.html
	<!DOCTYPE html><html><head>
		<meta charset="utf-8">
		<title>Web Development Bookmarks by vbwx</title>
	</head><body>
EOF
cat body.html >> WebDev.html
echo '</body></html>' >> WebDev.html
rm -f body.html
