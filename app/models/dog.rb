class Dog < ApplicationRecord
  belongs_to :owner, class_name: User.name, foreign_key: :owner_id, optional: true
  has_many :likes
  has_many_attached :images
  paginates_per 5
end
