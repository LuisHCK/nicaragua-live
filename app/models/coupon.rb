class Coupon < ApplicationRecord
  belongs_to :profile
  has_many :coupon_redemptions

  has_attached_file :picture, styles: { thumb: ["64#", :jpg],
						original: ['350x200!', :jpg] },
	convert_options: { thumb: "-quality 85 -strip",
										 original: "-quality 90 -strip" }, default_url: "coupon-default.jpg"
  
  validates_attachment :picture, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
