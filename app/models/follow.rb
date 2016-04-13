class Follow < ActiveRecord::Base
  belongs_to :clientprofile, dependent: :destroy
  belongs_to :profile, dependent: :destroy

  validates :profile_id, uniqueness: {scope: :profile_id}
  #validates :clientprofile_id, uniqueness: {scope: :clientprofile_id}
end
