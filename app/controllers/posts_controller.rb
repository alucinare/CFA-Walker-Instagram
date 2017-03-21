class PostsController < ApplicationController
  # This is a Devise helper, we put this here to make sure a user is signed in to access the site. Before anything else happens in relation to any posts the person on the site must first be authenticated
  before_action :authenticate_user!

  # SELF CREATE - Walker
  # This is to make sure the another user's post cannot be accessed by another user
  before_action :owned_post, only: [:edit, :update, :destroy]

  before_action :set_post, only: [:show, :edit, :update, :destroy]



  # these are actions
  # would this be better going into a model?? because it is accessing the database to get all of the posts
  def index
    @post_all = Post.all
  end

  def new
    # OLD @post = Post.new - when there were no users
    # I didn't get this, it makes sense that it will have to be in the new, the DEVISE helper current_users calls on the currently logged in user, but I don't get the .post.build part but it creates a new object of the current_users
    @post = current_user.posts.build
  end

  # This creates a new post with the parameters coming from the post_params method,
  # which is private to this class, then redirects the posts path
  def create

    @post = current_user.posts.build(post_params)

    # OLD @post = Post.create(post_params)
    # this is asking if the post has save, it returns true if it has.
    if @post.save
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
    #SELF CREATE - me
    # this is how I implemented the solution to the problem of users accessing the edit function through a URL. It's not as secure or applicable to other actions. but it does work.
      # if @post.user.user_name != current_user.user_name
      #   flash[:alert] = "That post doesn't belong to you!"
      #   redirect_to posts_path
      # end
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

# this means whatever is after this cannot be called from outside this class
  private

    def set_post
      @post = Post.find(params[:id])
    end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

    def post_params
      # this is saying the params required are in the post model and that image and caption are the fields
      params.require(:post).permit(:image, :caption)
    end

    # This is a much better way of stopping users from accessing their posts by entering the route as a URL, this makes it secure to tihs class and makes it applicable to many actions in this class, the actions that are in the before_action method at the start
    def owned_post
      # like an if statement but the opposite of it
      unless current_user == @post.user
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end


end
