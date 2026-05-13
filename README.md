## ✳ Theme and references

- Theme:
    - https://github.com/lvntky/low
- Reference website:
    - https://fabiensanglard.net/

## 🧩 Directory Structure

```
docs/
├── _posts/               # Blog posts handled by Jekyll's built-in posts collection
├── _projects/            # Project entries handled by the custom projects collection
│   └── example.md
│
├── _layouts/
│   ├── default.html      # Base layout
│   ├── home.html         # Main index page
│   └── projects.html     # Individual project layout
│
├── _includes/
│   ├── project-list.html # Reusable project index
│   └── project-meta.html # Date, status, and tags for projects
│
├── archive.md            # Posts archive page
├── index.md              # Home page
└── projects.md           # Projects index page at /projects/
```

## Projects

Projects are stored in the custom Jekyll collection:

```text
docs/_projects/
```

The collection is enabled in `docs/_config.yml`:

```yml
collections:
  projects:
    output: true
    permalink: /projects/:name/
```

This makes every file in `_projects/` available through `site.projects` and
generates one page per project. For example:

```text
docs/_projects/example.md
```

is published at:

```text
/projects/example/
```

Project pages use the `projects` layout by default:

```yml
defaults:
  - scope:
      path: ""
      type: "projects"
    values:
      layout: "projects"
```

Create a new project with front matter like this:

```md
---
title: "My Project"
date: 2026-05-11
description: "A short description of what this project does."
status: "ongoing"
tags: [jekyll, example]
repository: "https://github.com/username/repo"
website: "https://example.com"
---

Write the project notes here.
```
