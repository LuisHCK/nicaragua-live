class Profile < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :offers, dependent: :destroy
	has_attached_file :cover,
                    styles: { thumb: ["64x64#", :jpg],
                              original: ['600x600#', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 95 -strip" },
									 url: "/system/covers/:id/:style/cover.jpg",
							     path: ":rails_root/public/system/covers/:id/:style/cover.jpg",
																			dependent: :destroy

	has_attached_file :avatar, styles: {mini: "400x400#"}, dependent: :destroy
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ , presence: true

	has_many :follows, dependent: :destroy
	has_many :clientprofiles, through: :follows

end
