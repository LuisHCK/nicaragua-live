class Heart < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }
  #validates :client_id, uniqueness: { scope: :post_id }
  belongs_to :post
  belongs_to :user
  belongs_to :client
end
