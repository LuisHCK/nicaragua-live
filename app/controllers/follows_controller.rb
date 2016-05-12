class FollowsController < ApplicationController
  respond_to :js

  def follow
    if client_signed_in?
    @clientprofile = current_client.clientprofile
    @profile = Profile.find(params[:profile_id])
    @clientprofile.follow!(@profile)
  else
    redirect_to new_client_session_path, notice: 'Debes iniciar sesión primero'
  end
  end

  def unfollow
    if client_signed_in?
    @clientprofile = current_client.clientprofile
    @follow = @clientprofile.follows.find_by_profile_id(params[:profile_id])
    @profile = Profile.find(params[:profile_id])
    @follow.destroy!
  else
    redirect_to new_client_session_path, notice: 'Debes iniciar sesión primero'
end

  end
end
