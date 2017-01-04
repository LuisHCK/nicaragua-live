json.array!(@releases) do |release|
  json.extract! release, :id, :version, :description, :changelog, :dwnl_link, :dwnl_count, :client_id
  json.url release_url(release, format: :json)
end
