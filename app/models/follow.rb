class Follow < ActiveRecord::Base
  belongs_to :client
  belongs_to :profile
  validates :profile_id, uniqueness: {scope: :profile_id}
  #validates :clientprofile_id, uniqueness: {scope: :clientprofile_id}
end
