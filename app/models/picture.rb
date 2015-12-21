class Picture < ActiveRecord::Base
	belongs_to :post

<<<<<<< HEAD
	has_attached_file :image, styles: {thumb: "600x600#"}
=======
	has_attached_file :image, styles: {tumb: "600x600#"}

>>>>>>> 3eacbaa7c5c9ecfea571c85c59a319af1cd84887
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true


end
