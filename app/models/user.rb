class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
