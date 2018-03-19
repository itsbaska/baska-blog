class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commentor, optional: true, class_name: "User", foreign_key: :commentor_id

  validates :guest_name, presence: true
  validates :body, presence: true
end
