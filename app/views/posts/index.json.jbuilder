json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :likes, :visit_count
  json.url post_url(post, format: :json)
end
