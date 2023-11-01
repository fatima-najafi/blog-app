class PostsController < ApplicationController
  # index action displaying a list of posts belonging to a specific user
  # first retrieves the user record base on user_id
  # next fetches all posts associated with that user using @user.posts

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(id: current_user.id)
    else
      flash[:alert] = 'Cannot create a new post'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
