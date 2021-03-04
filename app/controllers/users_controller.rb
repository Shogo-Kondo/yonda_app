class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user = User.new(user_name: params[:user_name], password: params[:password])
    @user.save
    redirect_to("/posts/index")
  end

  def edit
  end

  def update
  end

  def login_form
  end

  def login
    @user = User.find_by(user_name: params[:user_name])
    if @user
      redirect_to("/posts/index")
    else
      render("users/login_form")
    end
  end

  def logout
  end

end
