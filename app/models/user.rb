class User < ApplicationRecord

  has_secure_password

  has_many :posts, foreign_key: :author_id, class_name: "Post"
  has_many :comments, foreign_key: :commentor_id, class_name: "Comment"

  validates :username, presence: true, length: { minimum: 5 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
end
