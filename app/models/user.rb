class User < ApplicationRecord
  # パスワードをハッシュ化して安全性高める
  has_secure_password
end
