module PostsHelper
  def link_to_hashtag(tag)
    tag.gsub(/#\w+/){|hash| link_to hash, "/posts/hashtag/#{hash.downcase.delete('#')}" }.html_safe
  end
end
