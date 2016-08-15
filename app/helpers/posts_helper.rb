module PostsHelper
	def show_video(post)
		if post.video.present? || post.video =! ""
			if post.pictures.count < 1
				return youtube_video post.video
			else
				return "#{link_to(post.video)}#{'Ver video'}"
			end
		end
	end
end
