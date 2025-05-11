class Post < ApplicationRecord
  # Standard user relationship (as author)
  belongs_to :user
  
  # Creator relationship
  belongs_to :creator, class_name: 'User', optional: true
  
  # Editor relationships
  has_many :post_editors
  has_many :editors, through: :post_editors, source: :user
end