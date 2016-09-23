json.array!(@offer_saveds) do |offer_saved|
  json.extract! offer_saved, :id, :user_id, :offer_id
  json.url offer_saved_url(offer_saved, format: :json)
end
