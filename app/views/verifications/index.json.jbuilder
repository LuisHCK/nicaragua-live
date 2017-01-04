json.array!(@verifications) do |verification|
  json.extract! verification, :id, :profile_id
  json.url verification_url(verification, format: :json)
end
