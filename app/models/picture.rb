class Picture < ActiveRecord::Base
	belongs_to :post

	has_attached_file :image, styles: {thumb: "600x600#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true


end
