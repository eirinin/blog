#!/usr/bin/env python

import os
import re
import yaml

with open("_data/tags.yml", "r") as stream:
    tags = yaml.load(stream)
if tags is None:
    tags = []

names = dict()
# Validation of key and name
for tag in tags:
    if "key" not in tag or "name" not in tag:
        raise Exception("tag `{}` malformed".format(tag))
    if tag["name"] != "FIX":
        names[tag["key"]] = tag["name"]

# Check for new tag in posts
tag_count = dict()
for pname in os.listdir("_posts"):
    yamlcount = 0
    fname = "_posts/{}".format(pname)
    for line in open(fname,"r").readlines():
        if re.match("---", line):
            yamlcount += 1
            if yamlcount == 2:
                raise Exception("Post {} has no tag".format(pname))
        if "tags" in line:
            for t in line.split()[1:]:
                if t in tag_count:
                    tag_count[t] += 1
                else:
                    tag_count[t] = 1
            break

with open("_data/tags.yml", "w") as fout:
    for key in tag_count.keys():
        if key in names:
            name = names[key]
        else:
            print("{} not found. Fix it".format(key))
            name = "FIX"
        fout.write("- key: {}\n".format(key))
        fout.write("  name: {}\n".format(name))
        fout.write("  count: {}\n".format(tag_count[key]))
