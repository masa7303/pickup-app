class User < ApplicationRecord
  # パスワードをハッシュ化して安全性高める
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
end
