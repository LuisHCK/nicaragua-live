class Follow < ActiveRecord::Base
  belongs_to :clientprofile
  belongs_to :profile

  validates :profile_id, uniqueness: {scope: :profile_id}
  #validates :clientprofile_id, uniqueness: {scope: :clientprofile_id}
end
