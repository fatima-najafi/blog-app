class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    puts params
  end
end
