class Post < ApplicationRecord
	validates :body, presence: true

	has_many :pictures, dependent: :destroy

	belongs_to :profile

	has_many :hearts, dependent: :destroy
  	has_many :users, through: :hearts

	has_many :comments, dependent: :destroy

	scope :five_days_ago, -> { where("created_at >= :date", :date => 15.days.ago) }

end
