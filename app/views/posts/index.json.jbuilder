json.posts @posts.each do |post|
	json.id post.id
	json.body post.body
	json.avatar post.profile.avatar.url
	json.username post.profile.name
	json.likes post.hearts.count
	json.comments_count post.comments.count
	json.date human_date(post.created_at)
	json.time human_time(post.created_at)

  json.comments (post.comments.each) do |comment|
  	json.extract! comment, :id, :body, :created_at, :updated_at
  end

end
