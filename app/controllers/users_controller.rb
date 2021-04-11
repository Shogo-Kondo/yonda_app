class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @user = User.find_by(user_name: params[:user_name])
    @myposts = Post.where(posted_user: @user.id).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_name: params[:user_name], password: params[:password1])

    if params[:password1] == params[:password2]
      if @user.save
        session[:user_id] = @user.id
        redirect_to("/users/#{@user.user_name}")
      else
        render("users/new")
      end
    else
      @error_message = "同じパスワードを入力してください"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(user_name: params[:user_name])
  end

  def update
    @user = User.find_by(user_name: params[:user_name])
    @user.nickname = params[:nickname]
    # @user.user_name = params[:user_name]
    @user.biography = params[:biography]
    if @user.save
      redirect_to("/users/#{@user.user_name}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(user_name: params[:user_name], password: params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.user_name}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @user_name = params[:user_name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end

  def ensure_correct_user
    if @current_user.user_name != params[:user_name]
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.user_name}")
    end
  end

end
