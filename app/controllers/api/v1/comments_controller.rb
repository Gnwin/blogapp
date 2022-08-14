module Api
  module V1
    class CommentsController < ApplicationController
      include ActionController::HttpAuthentication::Token
      def index
        @comments = Comment.where(post_id: params[:post_id]).where(user_id: params[:user_id]).order(:created_at)
        render json: { code: 200, success: true, message: 'Successfully loaded comments',
                       data: { comments: @comments } }
      end

      def create
        # p 'create started'
        # p params
        # @user = current_user
        # @post = Post.find(params[:post_id])
        # @comment = Comment.new(params.require(:comment).permit(:text))
        # @comment.user = @user
        # @comment.post = @post
        # p "got to end of variables user #{@user.name} post #{@post.text} comment on #{@comment.post.id}"

        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = params[:user_id]
        @comment.post_id = params[:post_id]

        if @comment.save
          # flash[:success] = 'New Post saved successfully!'
          # p @comment
          # redirect_to user_post_path(@user, @post)
          render json: { success: true, message: 'Successfully created comment', data: { comment: @comment } },
                 status: :created
        else
          # flash.now[:error] = 'Post failed..'
          # render :new
          render json: { success: false, errors: @comment.errors }, status: :unprocessable_entity
        end
      end

      # def new
      #   @comment = Comment.new
      #   @user = current_user
      #   @post = Post.find(params[:post_id])
      #   render :new
      #   p params
      # end

      # def destroy
      #   @post = Post.find(params[:post_id])
      #   @comment = @post.comments.find(params[:id])
      #   @comment.destroy
      #   @post.decrement(:comments_counter)
      #   @post.save
      #   redirect_to user_post_path(params[:user_id], params[:post_id])
      # end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end

      def no_record(post)
        render json: { success: false, message: "This post: #{post} does not exist" }, status: :not_found
      end

      def authenticate_user
        token, _options = token_and_options(request)
        raise token.inspect
      end
    end
  end
end
