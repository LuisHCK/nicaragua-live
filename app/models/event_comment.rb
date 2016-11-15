class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :event
  validates :body, presence: true
end
