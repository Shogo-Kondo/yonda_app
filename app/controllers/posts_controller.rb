class PostsController < ApplicationController
  before_action :authenticate_user

  # 投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(25)
  end

  # 投稿詳細
  def show
    @post = Post.find_by(id: params[:id])
  end

  # 新規投稿
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], author: params[:author], posted_user: @current_user.id)
    if @post.save
      # 保存成功
      redirect_to("/posts/index")
    else
      # 保存失敗
      render("posts/new")
    end
  end

  # 編集
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.author = params[:author]
    @post.content = params[:content]
    
    if @post.save
      # 保存成功
      redirect_to("/posts/index")
    else
      # 保存失敗
      render("posts/edit")
    end
  end

  # 削除
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

  def ranking
  end

  def favorite
  end

end
