class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_one_attached :image

end
