class PostsController < ApplicationController
  # index action displaying a list of posts belonging to a specific user
  # first retrieves the user record base on user_id
  # next fetches all posts associated with that user using @user.posts

  def index
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    @posts = @user.posts.includes(:commnets)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = User.find(params[:user_id])

    if @post.save
      flash[:notice] = 'Post created successfully!'
      redirect_to user_posts_path(id: @post.id)
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
