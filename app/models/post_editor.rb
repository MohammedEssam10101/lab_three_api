class PostEditor < ApplicationRecord
  belongs_to :post
  belongs_to :user # This user acts as an editor
end