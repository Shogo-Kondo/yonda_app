class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def edit
    redirect_to("/posts/index")
  end
end
