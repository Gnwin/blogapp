class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # def authenticate_user!
  #   if user_signed_in?
  #     super

  #   else
  #     redirect_to new_user_session_path, notice: 'Please sign in'
  # end
end
