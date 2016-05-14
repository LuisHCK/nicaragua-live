class FollowsController < ApplicationController
  respond_to :js

  def follow
    if client_signed_in?
    @client = current_client
    @profile = Profile.find(params[:profile_id])
    @client.follow!(@profile)
  else
    redirect_to new_client_session_path, notice: 'Debes iniciar seción primero'
  end
  end

  def unfollow
    if client_signed_in?
    @client = current_client
    @follow = @client.follows.find_by_profile_id(params[:profile_id])
    @profile = Profile.find(params[:profile_id])
    @follow.destroy!
  else
    redirect_to new_client_session_path, notice: 'Debes iniciar seción primero'
end

  end
end
