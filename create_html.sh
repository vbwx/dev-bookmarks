#!/bin/bash

# Install dependencies
command -v marked > /dev/null || npm install -g marked

cat *.md | marked -o body.html
cat <<-'EOF' > WebDev.html
	<!DOCTYPE html><html><head>
		<meta charset="utf-8">
		<title>Web Development Bookmarks by vbwx</title>
		<style>body{font:0.9em/1.4 "Helvetica Neue",Helvetica,Arial,sans-serif}h2,h2+ul{margin-left:2rem}h3,h3+ul{margin-left:4rem}ul{list-style:none;padding-left:2rem}h1,h2,h3{font-weight:normal;cursor:pointer}a{outline:none;text-decoration:none}a:focus{text-decoration:underline}a:link,a:visited{color:#0261E5}a:active,a:focus,a:hover{color:#102EA1}.c+ul,.c+div{display:none}.c::before{content:'▸ '}.o{position:relative;left:-0.21ex}.o::before{content:'▾ '}</style>
	</head><body>
EOF
sed 's/#nodejs/#node-js/' body.html | sed 's/<!--div-->/<div>/' | sed 's/<!--\/div-->/<\/div>/' >> WebDev.html
cat <<-'EOF' >> WebDev.html
	<script>$=function(n,f){[].forEach.call(document.getElementsByTagName(n),f)},toggle=function(b){['h1','h2','h3'].forEach(function(h){$(h,function(t){t.className=b?'o':'c'})})};['h2','h3'].forEach(function(h){$(h,function(t){t.addEventListener('click',function(){this.className=this.className==='c'?'o':'c'})})});$('h1',function(t){t.addEventListener('click',function(){toggle(this.className==='c')})});$('a',function(t){if(t.getAttribute('href')[0]!=='#')t.target="_blank"});toggle(!1)</script>
	</body></html>
EOF
rm -f body.html
