module CommentsHelper
	def delete_comment(comment)
		#concatenate
		if user_signed_in? 
			if comment.user_id == current_user.id
				link_to post_comment_path(comment.post, comment), data: { confirm: '¿Borrar tu comentario?' }, class:"btn btn-danger pull-right", method: :delete do
					icon('trash-o')
				end 
			end 
		end
	end


end
