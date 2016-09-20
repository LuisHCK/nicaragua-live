json.array!(@verification_requests) do |verification_request|
  json.extract! verification_request, :id, :user_id
  json.url verification_request_url(verification_request, format: :json)
end
