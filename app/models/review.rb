class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates_uniqueness_of :shop_id, scope: :user_id
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 500 }
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  has_one_attached :review_image

end
