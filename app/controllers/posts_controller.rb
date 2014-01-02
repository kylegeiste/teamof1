class PostsController < ApplicationController

def new
	@post = Post.new
end

def create
  @post = Post.new(post_params)
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end

def show
	@post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id]) #fixed indentation
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(post_params) #replaced params[:post].permit(:title, :url, :text) with just post_params
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  #`@post.destroy` will try to destroy your record in the database *best-effort* 
  #This means that there could be an error during destroy and your code would go on its merry way
  #To check if the record was actually destroyed, you can check the value of the attribute 
  #`destroyed` by calling `@post.destroyed?`
 
  redirect_to posts_path
end

def index
	@posts = Post.all
end

private

def post_params
	params.require(:post).permit(:title, :url, :text)
end

end
