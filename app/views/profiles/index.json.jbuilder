json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user, :cover, :body, :direccion, :horario, :facebook, :twiter, :instagram, :youtube, :other
  json.url profile_url(profile, format: :json)
end
