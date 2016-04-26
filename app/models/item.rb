class Item < ActiveRecord::Base
  #before_destroy :no_referenced_pictures
  belongs_to :client
  belongs_to :market
  has_many :pictures, dependent: :destroy

  validates :titulo, presence: true
  validates :precio, presence: true
  validates :nombre, presence: true
  validates :telefono, presence: true
end
