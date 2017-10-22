class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validate :avatar_size_range

  has_many :comments, foreign_key: "author_id"
  has_many :posts, foreign_key: "author_id"

  has_secure_password

  private

  def  avatar_size_range
    errors[:avatar] << "should be less than 3MB" if avatar.size > 3.megabytes
  end
end
