module PostsHelper
	def show_video(post)
		if post.video.present? || post.video =! nil
			if post.pictures.count < 1
				return youtube_video post.video
			else
				return "#{link_to(post.video)}#{'Ver video'}"
			end
		end
	end
	def pin_post(post)
		if user_signed_in?
			if current_user.id == post.profile.user_id
				if post.pin==false
					link_to('Destacar', post_path(id: post.id, 'post[pin]'=>1), method: :put)
					elsif post.pin==true
						link_to('Marcada', post_path(id: post.id, 'post[pin]'=>0), method: :put)
						end
					end
				end
			end

			def post_delete(post)
				if user_signed_in?
					if current_user.id == post.profile.user_id
						link_to("Eliminar",post_path(post), method: :delete, data: { confirm: '¿Estás seguro de borrar esta publicación?' })
					end
				end
			end

  #buttons fror post
  def post_edit(post)
  	if user_signed_in?
  		if current_user.id == post.profile.user_id
  			return link_to("Editar",edit_post_path(post))
  		end
  	end
  end

  def post_comments(post)
  	if user_signed_in? or user_signed_in?
  		render '/comments/form'
  	else
  		link_to "Inicia sesión", new_user_session_path
  	end
  end

  def my_post?(post)
  	if user_signed_in?
  		if current_user.id == post.profile.user_id
  			return true
  		else
  			return false
  		end
  	end

  end

end
