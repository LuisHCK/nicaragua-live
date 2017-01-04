json.extract! coupon, :id, :title, :description, :ammount, :max_redemptions, :code, :start_date, :end_date, :profile_id, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)