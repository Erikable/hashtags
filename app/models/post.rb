class Post < ApplicationRecord
  has_many :tags_posts
  has_many :tags, through: :tags_posts

  after_create do
    post = Post.find_by(id: self.id)
    hashtag = self.body.scan(/#\w+/)
    hashtag.uniq.map do |h|
      tag = Tag.find_or_create_by(name: h.downcase.delete('#'))
      post.tags << tag
    end
  end

  after_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    hashtag = self.body.scan(/#\w+/)
    hashtag.uniq.map do |h|
      tag = Tag.find_or_create_by(name: h.downcase.delete('#'))
      post.tags << tag
    end
  end
end
