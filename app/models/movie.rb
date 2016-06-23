class Movie < ActiveRecord::Base
	has_attached_file :cover, styles: { thumb: ["64x64#", :jpg],
						original: ['600', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 90 -strip" }, default_url: "cover-default.png"

	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true


end
