class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    # 1 - is a rails command and 2 - is a helper
    # it redirects to whatever page, in this case the index because posts path is posts/index
    else
      flash.now[:alert] = "Your post couldn't be created. Please try again."
      render :new
    end
  end


  def show
    # an id is given to each post automatically
    # this finds the id of the object and assigns the whole
    # object to the post variable
    # This line has been circumvented by the "before_action"
    # @post = Post.find(params[:id])
  end

  def edit
    # This directs the
    # @post = Post.find(params[:id])
  end

  def update
    # like the previous, this finds id of the current post and slots it into @post
    # @post = Post.find(params[:id])
    # This is an inbuilt function that updates an attribute in an object row of the table
    # post_params is the parameters that are to be potentially updated, in this case the
    # immage and caption of a post
    if @post.update(post_params)
      flash[:success] = "Your post has been edited!"
      redirect_to posts_path
    # this redirects to the current path of the post
    else
      flash.now[:alert] = "Your post couldn't be edited. Please try again."
      render :edit
    end
  end


  def destroy
    # @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Your post has been deleted!"
      redirect_to posts_path
    # this redirects to the current path of the post
    else
      flash.now[:alert] = "Your post couldn't be deleted. Please try again."
      render :edit
    end
  end

  private # this means whatever is after this cannot be called from outside this class

    def set_post
      @post = Post.find(params[:id])
    end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

    def post_params
      # this is saying the params required are in the post model and that image and caption are the fields
      params.require(:post).permit(:image, :caption)
    end


end
