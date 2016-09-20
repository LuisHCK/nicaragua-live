json.array!(@partners) do |partner|
  json.extract! partner, :id, :partner_range, :user_id
  json.url partner_url(partner, format: :json)
end
