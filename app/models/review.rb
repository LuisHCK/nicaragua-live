class Review < ActiveRecord::Base
  belongs_to :profile
  belongs_to :user
  validates_numericality_of :rating, greater_than: 0, message: "debe indicar una valoración" 
end
