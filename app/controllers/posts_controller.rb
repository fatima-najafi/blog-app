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
end
