class Offer < ActiveRecord::Base
  searchkick #searchable: [:titulo,:descripcion,:precio]
  belongs_to :profile
  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :precio, presence:  true
  has_attached_file :image,
                    styles: { thumb: ["64x64#", :jpg],
                              original: ['500x500#', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 90 -strip" }, dependent: :destroy

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true

#Search method
end
