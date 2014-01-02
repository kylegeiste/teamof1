class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body)) 
    #Refactor the strong parameters portion of the line above to its own method
    @comment.commenter = current_user
    redirect_to post_path(@post)
  end

private
	#strong parameters, to prevent misuse
    def user_params
      params.require(:user.permit(:display_name)) #Does this work?  Or did you mean params.require(:user).permit(:display_name)
    end
end
