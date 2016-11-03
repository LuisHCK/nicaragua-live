class Offer < ApplicationRecord
  searchkick searchable: [:titulo,:descripcion,:precio]
  belongs_to :profile
  has_many :offer_saveds
  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :precio, presence:  true
  has_attached_file :image,
                    styles: { thumb: ["95x95#", :jpg],
                              original: ['300x300#', :jpg] },
                    convert_options: { thumb: "-quality 85 -strip",
                                       original: "-quality 85 -strip" }, dependent: :destroy

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ , presence: true

#Search method
end
