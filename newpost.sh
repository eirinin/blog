#!/bin/bash

echo -n "Title: "
read -r title
echo -n "name: "
read -r name
date=$(date +"%Y-%m-%d")

filename=$date-$name.md

cat >> _posts/$filename << EOF
---
layout: post
title:  $title
date:   $date
name:   $date-$name
---
EOF

vim _posts/$filename
