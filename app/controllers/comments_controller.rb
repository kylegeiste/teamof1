class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@post)
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end
