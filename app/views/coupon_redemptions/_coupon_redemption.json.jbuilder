json.extract! coupon_redemption, :id, :user_id, :profile_id, :created_at, :updated_at
json.url coupon_redemption_url(coupon_redemption, format: :json)