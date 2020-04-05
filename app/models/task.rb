class Task < ApplicationRecord
  acts_as_taggable
  include Common

  validates :name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
