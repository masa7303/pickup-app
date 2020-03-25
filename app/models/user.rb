class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
  has_many :comments

  has_one_attached :image
end
