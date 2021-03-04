class PostsController < ApplicationController

  def index
  end

  def new
  end

  def edit
    redirect_to("/posts/index")
  end
end
