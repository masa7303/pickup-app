class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
  has_many :comments

  # 外部キーをfollowing_idとしているので、フォローする側から見たRelasionships
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  # 外部キーをfollower_idとしているので、フォローされる側から見たRelasionships
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_one_attached :image

  def followed_by?(user)
    passive_relationships.where(following_id: user.id).present?
  end

end
