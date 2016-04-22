class Post < ActiveRecord::Base
	validates :body, presence: true

	has_many :pictures, dependent: :destroy

	belongs_to :profile

	has_many :hearts, dependent: :destroy
  has_many :users, through: :hearts

	has_many :comments
end
