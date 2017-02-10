#!/bin/bash

echo -n "Title: "
read -r title
name=$(echo $title | tr ' ' '-' | sed 's/\.//g' | iconv -f utf8 -t ascii//TRANSLIT)
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
