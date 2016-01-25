json.array!(@clientprofiles) do |clientprofile|
  json.extract! clientprofile, :id, :name
  json.url clientprofile_url(clientprofile, format: :json)
end
