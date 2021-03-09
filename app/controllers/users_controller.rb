class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_name: params[:user_name], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.user_name = params[:user_name]
    if @user.save
      redirect_to("/users/#{@user.id}")
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
      redirect_to("/posts/index")
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
    if @current_user.id != params[:id].to_i
      redirect_to("/posts/index")
    end
  end

end
