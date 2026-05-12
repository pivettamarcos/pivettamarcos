module Jekyll
  class TagPageGenerator < Generator
    safe true

    def generate(site)
      tags = []
      tags.concat(site.posts.docs.flat_map { |post| post.data["tags"] || [] })
      tags.concat(Array(site.collections["projects"]&.docs).flat_map { |project| project.data["tags"] || [] })

      tags.uniq.each do |tag|
        site.pages << TagPage.new(site, site.source, tag)
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, tag)
      @site = site
      @base = base
      @dir  = File.join("tags", Jekyll::Utils.slugify(tag))
      @name = "index.html"

      process(@name)
      read_yaml(File.join(base, "_layouts"), "tag.html")
      data["tag"]    = tag
      data["title"]  = "Tag: #{tag}"
      data["layout"] = "tag"
    end
  end
end
