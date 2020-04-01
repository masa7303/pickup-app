class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :shops
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :relationships, foreign_key: :user_id, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_one_attached :image

  validates :name, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true, presence: true

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def liked?(shop)
    likes.exists?(shop_id: shop.id)
  end

end
