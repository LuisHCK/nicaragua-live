class Comment < ApplicationRecord
  belongs_to :user
  #belongs_to :client
  belongs_to :post
  validates :body, presence: true
end
