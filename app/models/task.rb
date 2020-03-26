class Task < ApplicationRecord
  acts_as_taggable
  
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments
end
