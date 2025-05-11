class User < ApplicationRecord
  # Standard posts relationship (as author)
  has_many :posts
  
  # Posts where user is a creator
  has_many :created_posts, class_name: 'Post', foreign_key: 'creator_id'
  
  # Posts where user is an editor
  has_many :post_editors
  has_many :edited_posts, through: :post_editors, source: :post
end