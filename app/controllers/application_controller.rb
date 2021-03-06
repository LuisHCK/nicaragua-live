class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_client!
  after_action :user_activity

	private

	def user_activity
	  current_user.try :touch
	end
end
