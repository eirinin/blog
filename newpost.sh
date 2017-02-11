#!/bin/bash

echo -n "Title: "
read -r title
name=$(echo $title | tr ' :' '--' | sed 's/\.//g' | sed 's/-\+/-/g' |\
  iconv -f utf8 -t ascii//TRANSLIT | tr 'A-Z' 'a-z')
title=$(echo $title | sed 's/:/&#58;/g')
date=$(date +"%Y-%m-%d")

filename=$date-$name.md

cat >> _posts/$filename << EOF
---
layout: post
title: $title
date: $date
name: $date-$name
tags:
---
EOF

vim _posts/$filename
