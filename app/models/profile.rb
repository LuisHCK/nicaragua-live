class Profile < ActiveRecord::Base
	has_many :posts
	has_many :offers
	has_attached_file :cover, styles: {card: "600x600#"}
	has_attached_file :cover, styles: {strech: "600x300#"}
	has_attached_file :avatar, styles: {mini: "400x400#"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ , presence: true

	has_many :follows, dependent: :destroy
	has_many :clientprofiles, through: :follows
end
