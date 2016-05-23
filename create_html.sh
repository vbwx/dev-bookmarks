#!/bin/bash

# Install dependencies
command -v marked > /dev/null || npm install -g marked

cat *.md | marked -o body.html
cat <<- EOF > WebDev.html
	<!DOCTYPE html><html><head>
		<meta charset="utf-8">
		<title>Web Development Bookmarks by vbwx</title>
		<style>body{font:0.9em/1.2 "Helvetica Neue",Helvetica,Arial,sans-serif}h2,h2+ul{margin-left:2em}h3,h3+ul{margin-left:4em}ul,li{list-style:none}</style>
	</head><body>
EOF
cat body.html >> WebDev.html
echo '</body></html>' >> WebDev.html
rm -f body.html
