class Category < ActiveRecord::Base
	has_many :profiles
	has_many :users
end
