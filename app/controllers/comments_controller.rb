class CommentsController < ApplicationController
  # In the new action, a new instance of the Comment
  #  model is created and assigned to the @comment instance variable. 
  # This is typically used when you want to render a form for creating a new comment. 
  # The new.html.erb view can then access this instance variable to build the form.
  def new
    @comment = Comment.new
  end

  def create
        @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      flash[:alert] = 'An error has occurred while creating the comment'
      render :new
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
