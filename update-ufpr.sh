#!/bin/bash

jekyll build --config=_config-ufpr.yml

lftp -c "set ftp:list-options -a;
open abelsiqueira@people.ufpr.br;
lcd _site;
cd html;
mkdir blog;
cd blog;
mirror --reverse --verbose --delete --only-newer"
