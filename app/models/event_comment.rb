class EventComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :event
  validates :body, presence: true
end
