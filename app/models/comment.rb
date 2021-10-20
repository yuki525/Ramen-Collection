class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :body, presence: true, { maximum: 300 }
end
