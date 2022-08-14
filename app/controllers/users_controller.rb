class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all
    @users = current_user

    respond_to do |format|
      format.html
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    @recent_posts = @user.recent_posts

    respond_to do |format|
      format.html
      format.xml { render xml: @user.posts }
      format.json { render json: @user }
    end
  end
end
