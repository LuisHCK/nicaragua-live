class FollowsController < ApplicationController
  respond_to :js

  def follow
    if user_signed_in?
    @user = current_user
    @profile = Profile.find(params[:profile_id])
    @user.follow!(@profile)
  else
    redirect_to new_user_session_path, notice: 'Debes iniciar sesión primero'
  end
  end

  def unfollow
    if user_signed_in?
    @user = current_user
    @follow = @user.follows.find_by_profile_id(params[:profile_id])
    @profile = Profile.find(params[:profile_id])
    @follow.destroy!
  else
    redirect_to new_user_session_path, notice: 'Debes iniciar sesión primero'
end

  end
end
