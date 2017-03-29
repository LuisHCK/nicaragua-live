class Profile < ApplicationRecord
	#Make fields obligatory
	validates :name, presence: true
	validates :offer_section_name, presence: true
	validates :direccion, presence: true
	validates :category_id, presence: true

	#index fields to search
	#searchkick searchable: [:name,:body,:keywords]
	
	#Asociations
	has_many :reviews
	has_one :verification
	has_many :posts, dependent: :destroy
	has_many :offers, dependent: :destroy
	has_many :hearts
	has_many :follows, dependent: :destroy
	has_one  :partner
	has_many :coupons

	has_attached_file :cover,
	styles: { thumb: ["64x64#", :jpg],
		original: ['600x600#', :jpg] },
		convert_options: { thumb: "-quality 75 -strip",
			original: "-quality 95 -strip" },
			url: "/system/covers/:id/:style/cover.jpg",
			path: ":rails_root/public/system/covers/:id/:style/cover.jpg", default_url: "cover-default.png"

	has_attached_file :avatar, styles: { thumb: ["80x80#", :jpg],
		url: "/system/avatars/:id/:style/avatar.jpg",
		original: ['300x300#', :jpg] },
			convert_options: { thumb: "-quality 85 -strip",
			original: "-quality 85 -strip" }, default_url: "icon-user-default.png"

	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

#	has_many :clientprofiles, through: :follows
end
