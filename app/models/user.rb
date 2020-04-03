class User < ApplicationRecord
  authenticates_with_sorcery!

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

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :role, presence: true

  enum role: { normal: 0, admin: 1, guest: 2 }

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
