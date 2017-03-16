class PostsController < ApplicationController
  # these are actions
  def index
    @post_all = Post.all
  end

  def new
    @post = Post.new
  end

  # This creates a new post with the parameters coming from the post_params method,
  # which is private to this class, then redirects the posts path
  def create
    @post = Post.create( post_params )
    # 1 - is a rails command and 2 - is a helper
    # it redirects to whatever page, in this case the index because posts path is posts/index
    redirect_to posts_path
  end

  private # this means whatever is after this cannot be called from outside this class

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def post_params
    # this is saying the params required are in the post model and that image and caption are the fields
    params.require(:post).permit(:image, :caption)
  end


end
