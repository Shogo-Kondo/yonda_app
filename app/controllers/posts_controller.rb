class PostsController < ApplicationController
  before_action :authenticate_user

  def index
    # @posts = Post.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], author: params[:author], posted_user: @current_user.id)
    if @post.save
      redirect_to("/users/#{@current_user.user_name}")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.author = params[:author]
    @post.publisher = params[:publisher]
    @post.content = params[:content]
    
    if @post.save
      # 保存成功
      redirect_to("/users/#{@current_user.user_name}")
    else
      # 保存失敗
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/users/#{@current_user.user_name}")
  end

  def ranking
  end

  def favorite
  end

end
