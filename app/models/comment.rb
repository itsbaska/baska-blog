class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commentor, optional: true, class_name: "User", foreign_key: :commentor_id

  validates :body, presence: true
  validates :guest_name, presence: true


end
