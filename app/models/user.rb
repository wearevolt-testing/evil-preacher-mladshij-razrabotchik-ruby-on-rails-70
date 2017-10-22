class User < ApplicationRecord
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :comments, foreign_key: "author_id"
  has_many :posts, foreign_key: "author_id"

  has_secure_password
end
