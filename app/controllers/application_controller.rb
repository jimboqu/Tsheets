class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected
  def user_not_authorized
  	redirect_to edit_user_registration_path, alert: "No can do old chum!"
  end
end