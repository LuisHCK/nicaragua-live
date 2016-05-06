class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :post
  belongs_to :event
  validates :body, presence: true
end
