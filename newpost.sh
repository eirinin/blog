#!/bin/bash
today=$(date +"%Y-%m-%d")
echo -n "Title: "
read title
declare -l fname
fname=$(echo $today-${title// /-} | iconv -f utf8 -t ascii//TRANSLIT)
if [ -f _posts/$fname.markdown ]; then
  echo "ERROR: File $fname.markdown already exists"
  exit 1
fi
cat > _posts/$fname.markdown << EOF
---
layout:      post
title:       $title
date:        $today
categories:
name:        $fname
---
EOF

vim _posts/$fname.markdown
