class Clientprofile < ActiveRecord::Base
  belongs_to :client, dependent: :destroy
  has_attached_file :cover, styles: {card: "600x600#"}, default_url: "icon-user-default.png"
  has_attached_file :avatar, styles: {mini: "400x400#"}, default_url: "icon-user-default.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ , presence: true

  validates :name, presence: true
end