class User < ApplicationRecord
  include BCrypt

  has_many :posts
  has_many :comments

  validates :username, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
