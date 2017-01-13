class Clientprofile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  has_attached_file :cover, styles: { thumb: ["64x64#", :jpg],
            original: ['600x600#', :jpg] },
  convert_options: { thumb: "-quality 85 -strip",
                     original: "-quality 90 -strip" }, default_url: "icon-user-default.png"


  has_attached_file :avatar, styles: { thumb: ["80x80#", :jpg],
            original: ['300x300#', :jpg] },
            convert_options: { thumb: "-quality 85 -strip",
            original: "-quality 85 -strip" }, default_url: "icon-user-default.png"


  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  #validates :name, presence: true
end
