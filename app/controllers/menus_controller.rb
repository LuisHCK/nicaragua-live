class MenusController < ApplicationController
	def index
	end

	def tools
		if user_signed_in?
    		@posts = Post.where(profile_id: current_user.profile.id)
    		@hearts = Heart.where(post_id: current_user.profile.posts.collect(&:id))
			@coupon = Coupon.new
			#@active_coupons = current

			type = view_context.get_survey_type(params[:type])
		    query = if type then Survey::Survey.where(survey_type: type) else Survey::Survey end
		    @surveys = query.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])end
	end
end
