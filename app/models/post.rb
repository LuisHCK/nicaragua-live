class Post < ActiveRecord::Base

	has_many :pictures, :dependent => :destroy

	belongs_to :profile
	
	has_many :hearts, dependent: :destroy
  has_many :users, through: :hearts
end
