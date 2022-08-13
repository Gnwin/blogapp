class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
    @users = current_user
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    @recent_posts = @user.recent_posts
  end
end
