class Picture < ActiveRecord::Base
	belongs_to :post

	has_attached_file :image, styles: { thumb: ["64x64#", :jpg],
						original: ['600', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 95 -strip" }

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true


end
