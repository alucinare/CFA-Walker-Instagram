class CommentsController < ApplicationController

  before_action :set_post

  def create
    # This was my original attempt. I had the right idea, however,
    # @comment = current_user.posts.build(post_params)
    # This assigns the comments on the @post object as a object in memory with text to @comment
    # This is different from the one I put in. This has to do with the POST first and the comments.
    # The relationship here is of a post that has a comment, not a current uses that is creating a post. However, we need to change whatever user the post is associated with to the user currently logged in.
    @comment = @post.comments.build(comment_params)

    #  Interesting - this is where the current_user id comes from. I thought I would put it in there before the posts up the top, but that wouldn't have worked or wouldn't have been good practice?? or something else. In anycase this is clear about what's happening
    @comment.user_id = current_user.id

    # I got this right. This will save the comment object to the database, and return a true if it does save which will result in a message telling the user  the comment has been added and navigate to the previous page.
    if @comment.save
      flash[:success] = "Your comment has been added"
      redirect_to :back
    # 1 - is a rails command and 2 - is a helper
    # it redirects to whatever page, in this case the index because posts path is posts/index
    else
      flash.now[:alert] = "Your comment couldn't be added. Please try again."
      render root_path # I had :new which would reload the new comment page
    end

  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.destroy
      flash[:success] = "Your post has been deleted!"
      redirect_to posts_path
    # this redirects to the current path of the post
    else
      flash.now[:alert] = "Your post couldn't be deleted. Please try again."
      render :edit
    end
  end


  private

    # I was correct with this one. This is about whitelisting, listing the stuff that can be altered in the DB. In this case the comment model is required and the content field is allowed to be updated.
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      # This will go into the Post table find the id of the post, to make sure the post we are commenting on will be the post that we are currently viewing. The post_id will be the automatically generated number and will be in the URL
      @post = Post.find(params[:post_id])
    end


end
