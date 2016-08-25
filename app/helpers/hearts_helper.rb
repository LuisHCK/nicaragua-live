module HeartsHelper
	def heart_button(post)
		if user_signed_in?

			if current_user.heart?(post)
				return button_to unheart_path(post_id: post.id), remote: true, method: :delete, class:"btn-link" do

					concat icon('heart',class:'red-text', style:'font-size:2rem;')
					concat content_tag(:span, post.hearts.count,class:'label label-info')
				end

			else

				return button_to heart_path(post_id: post.id), remote: true, class:"btn-link" do
					icon('heart-o',style:'font-size:2rem')
					content_tag(:span, post.hearts.count,class:'label label-info')
				end
			end

		elsif client_signed_in?

			if current_client.heart?(post)
				return button_to unheart_path(post_id: post.id), remote: true, method: :delete, class:"btn-link" do
					concat icon('heart',class:'red-text', style:'font-size:2rem;')
					concat content_tag(:span, post.hearts.count,class:'label label-info')
				end
			else

				return button_to heart_path(post_id: post.id), remote: true, class:"btn-link" do
					concat icon('heart-o',style:'font-size:2rem')
					concat content_tag(:span, post.hearts.count,class:'label label-info')
				end
			end
		end

		if client_signed_in? or user_signed_in?
		else
			if post.hearts.count > 0
				concat icon('heart',class:'red-text', style:'font-size:2rem;')
				content_tag(:span, post.hearts.count,class:'label label-info')
			else
				icon('heart-o',style:'font-size:2rem')
			end
		end

end#end method
end
