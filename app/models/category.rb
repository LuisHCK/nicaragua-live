class Category < ApplicationRecord
	has_many :profiles
	has_many :users
end
