class Profile < ActiveRecord::Base
	has_many :posts
	has_attached_file :cover, styles: {card: "600x600#"}
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true

end
