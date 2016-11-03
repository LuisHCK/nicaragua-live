class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  #validates :profile_id, uniqueness: {scope: :profile_id}
end
