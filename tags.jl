#!/usr/bin/env julia

using YAML

# This script is designed to create the tags file for use in `tags.md`
# There is the naming issue, which I also want to handle semi-automatically
# When I create a new tag, this should ask for what's the name for it.
# If the tag is already on the file, then there is no need for it.
function create_tags()
  # Existing tags
  data = YAML.load(open("_data/tags.yml"))
  for d in data
    d["count"] = 0
  end
  keys = [d["key"] for d in data]

  # Check each tag
  for file in readdir("_posts")
    if isdir(joinpath("_posts", file)); continue; end

    # Get all tags in post
    println("file = $file")
    tags = YAML.load(open(joinpath("_posts", file)))
    if !haskey(tags, "tags")
      error("Post $file does not have tags")
    end
    tags = split(tags["tags"])

    for tag in tags
      # Only lowercase
      if !islower(tag)
        error("On post $file, tag $tag should be lower case.")
      end
      i = findfirst(tag .== keys)
      if i == 0
        print("Name for tag $tag: ")
        name = chomp(readline(STDIN))
        push!(data, Dict("key"=>tag, "name"=>name, "count"=>1))
        push!(keys, tag)
      else
        data[i]["count"] += 1
      end
    end
  end

  open("_data/tags.yml", "w") do tagfile
    for d in data
      key, name, count = d["key"], d["name"], d["count"]
      println(tagfile, "- key:   $key")
      println(tagfile, "  name:  $name")
      println(tagfile, "  count: $count")
    end
  end
end

create_tags()
