class Movie < ApplicationRecord
	has_attached_file :cover, styles: { thumb: ["64#", :jpg],
						original: ['600', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 90 -strip" }, default_url: "cover-default.png"

	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true

	has_attached_file :banner, styles: { thumb: ["64#", :jpg],
						original: ['345x516!', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 90 -strip" }, default_url: "banner-default.png"

	validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/ , presence: true


end
