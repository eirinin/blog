---
layout: page
title: Tags
permalink: /tags/
---

{% assign tags = site.data.tags | sort: 'count' | reverse %}

<div style="height: 600px;" id="tagcloud"> </div>

<hr>

<div id="taglist">
<h3 id="taglisth3"></h3>
</div>

<script>
var words = [
	{% for tag in tags %}
		{text: "{{ tag.name }}",
		weight: {{ tag.count }},
    html: { class: "cloud-word" },
		handlers: {click: function() {
document.getElementById('taglist').innerHTML = '<h3 id="taglisth3">{{ tag.name }} posts</h3>\
<ul class="post-list-compact">\
{% for post in site.posts %} {% for t in post.tags %} {% if t == tag.key %}\
<li> <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">\
{{ post.title }} </a> <span class="post-list-date">\
{{ post.date | date: "%d %b, %Y" }}</span> </li>\
{% endif %} {% endfor %} {% endfor %} </ul>';
		}},
		link: "#taglisth3"
	},
	{% endfor %}
];
$(function() {
	$('#tagcloud').jQCloud(words, {
		autoResize: true,
    delay: 10,
    classPattern: null,
    steps: 10,
    colors: ["#a00",
             "#821",
             "#642",
             "#463",
             "#284",
             "#0a5",
             "#2a6",
             "#4a7",
             "#8a8",
             "#aaa"
             ],
    fontSize: { from: 0.1, to: 0.02 }
	});
});

</script>
