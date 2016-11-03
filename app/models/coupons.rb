class Coupons < ApplicationRecord
  include AASM

  aasm do
  end
  has_many :coupon_redemtions
end
