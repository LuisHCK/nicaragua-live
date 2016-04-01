class Offer < ActiveRecord::Base
  belongs_to :profile
  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :precio, presence:  true
  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                              original: ['600x600#', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" }

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true
end
