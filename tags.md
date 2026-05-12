---
layout: page
title: Tags
permalink: /tags/
---

{% assign all_tags = "" | split: "" %}
{% for post in site.posts %}
  {% for tag in post.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}

{% for project in site.projects %}
  {% for tag in project.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}

{% assign sorted_tags = all_tags | uniq | sort %}

{% for tag in sorted_tags %}
  {% assign tag_posts = site.posts | where_exp: "post", "post.tags contains tag" %}
  {% assign tag_projects = site.projects | where_exp: "project", "project.tags contains tag" %}
  {% assign tag_count = tag_posts.size | plus: tag_projects.size %}
  <div style="margin-bottom: 1ch;">
    <a href="{{ site.baseurl }}/tags/{{ tag | slugify }}/">{{ tag | upcase }}</a>
    <span style="opacity:.6;">({{ tag_count }})</span>
  </div>
{% endfor %}
