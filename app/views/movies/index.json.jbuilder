json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :original_title, :country, :production, :script, :allocation, :clasification, :sinopsis
  json.url movie_url(movie, format: :json)
end
