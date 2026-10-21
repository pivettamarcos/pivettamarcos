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

## ✍️ Adding content, building & deploying

Branches:

- `gh-pages-source` — edit here. This is the Jekyll site.
- `gh-pages` — generated output, published at `https://www.pivettamarcos.com`. Do not edit by hand.
- `main` — profile README only, unrelated.

New article — create `_posts/YYYY-MM-DD-slug.md`:

```md
---
layout: post
title: "My title"
date: 2026-10-21
description: "One-line summary"
tags: [tag1, tag2]
---

Content here.
```

New project — create `_projects/name.md` using the front matter template in the Projects section above.

Preview locally (needs Ruby 3.3 + Bundler):

```bash
bundle install
bundle exec jekyll serve
```

Deploy — just push `gh-pages-source`:

```bash
git checkout gh-pages-source
git push origin gh-pages-source
```

What happens next:

1. `.github/workflows/jekyll-to-gh-pages.yml` builds with Jekyll and pushes `./_site` to `gh-pages` (keeps `CNAME` = `www.pivettamarcos.com`).
2. The managed `pages build and deployment` workflow publishes `gh-pages`.
3. Check progress under the repo `Actions` tab.
