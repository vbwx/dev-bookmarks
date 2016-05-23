#!/bin/bash

# Install dependencies
command -v marked > /dev/null || npm install -g marked

cat *.md | marked -o body.html
cat <<- EOF > WebDev.html
	<!DOCTYPE html><html><head>
		<meta charset="utf-8">
		<title>Web Development Bookmarks by vbwx</title>
		<style>body{font:0.9em/1.3 "Helvetica Neue",Helvetica,Arial,sans-serif}h2,h2+ul{margin-left:2em}h3,h3+ul{margin-left:4em}ul{list-style:none;padding-left:2em}h1,h2,h3{font-weight:normal;cursor:pointer}a{outline:none;text-decoration:none}a:focus{text-decoration:underline}a:link,a:visited{color:#0261E5}a:active,a:focus,a:hover{color:#102EA1}.h{display:none}</style>
	</head><body>
EOF
cat body.html >> WebDev.html
echo <<-EOF >> WebDev.html
	<script>$=document.getElementsByTagName,toggle=function(){$('ul').forEach(function(t){if(t.className)t.className='';else t.className='h'})};['h2','h3'].forEach(function(h){$(h).forEach(function(t){t.onclick=function(){var s=this.nextSibling.nextSibling;if(s.className)s.className='';else s.className='h'}}}));$('h1').forEach(function(t){t.onclick=toggle});$('a').forEach(function(t){t.target="_blank"});toggle()</script>
	</body></html>
EOF
rm -f body.html
