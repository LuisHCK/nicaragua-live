class Coupons < ActiveRecord::Base
  include AASM

  aasm do
  end
  has_many :coupon_redemtions
end
