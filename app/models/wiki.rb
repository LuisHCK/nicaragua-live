class Wiki < ApplicationRecord
  has_attached_file :cover

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ , presence: true
end
