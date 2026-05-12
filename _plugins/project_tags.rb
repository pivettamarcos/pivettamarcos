def project_tag(value)
  value.to_s.strip.downcase.gsub(/\s+/, "-")
end

# Add project-derived tags so feed/category consumers can discover project
# relationships without duplicating front matter.
Jekyll::Hooks.register :site, :post_read do |site|
  site.posts.docs.each do |post|
    tag = project_tag(post.data["project"])
    next if tag.empty?

    tags = Array(post.data["tags"])
    post.data["tags"] = (tags + [tag]).uniq
  end

  Array(site.collections["projects"]&.docs).each do |project|
    tag = project_tag(project.data["title"])
    next if tag.empty?

    tags = Array(project.data["tags"])
    project.data["tags"] = (tags + [tag]).uniq
  end
end
