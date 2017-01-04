class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
  belongs_to :user

  has_many :event_comments

  has_attached_file :cover, styles: { thumb: ["64x64#", :jpg],
            original: ["780x300#", :jpg] },
  convert_options: { thumb: "-quality 85 -strip",
                     original: "-quality 90 -strip" }, dependent: :destroy

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

end
