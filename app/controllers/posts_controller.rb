class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :new, :create, :edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], author: params[:author], publisher: params[:publisher], content: params[:content], posted_user: @current_user.id, isbn_code: params[:isbn].gsub(/-/,""))
    if @post.save
      if @post.isbn_code != nil
        if Book.where(title: @post.title).empty?
          @book = Book.new(title: params[:title], author: params[:author], publisher: params[:publisher], isbn_code: params[:isbn].gsub(/-/,""))
          @book.save
        end
      end
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

  def follow
  end

end
