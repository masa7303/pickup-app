class Like < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :user_id, presence: true, uniqueness: { scope: :shop_id }
  validates :shop_id, presence: true
end
