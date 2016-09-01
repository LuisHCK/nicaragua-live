class Picture < ActiveRecord::Base
	belongs_to :post
	belongs_to :item

	has_attached_file :image, styles: { thumb: ["64x64#", :jpg],
						original: ['500', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 90 -strip" }, dependent: :destroy

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true


end
