class BooksController < ApplicationController

  def show
    @book = Book.find_by(isbn_code: params[:isbn_code])
    @reviews = Post.where(isbn_code: params[:isbn_code])
    @users = User.all
  end

  def search 
    kw = params[:search].to_s
    @book = Book.find_by('title LIKE ?', "%#{kw}%")

    if @book != nil
      @results = Book.where('title LIKE ?', "%#{kw}%")
    else
      flash[:notice] = "該当のキーワードは登録されていません"
      if @current_user
        redirect_to("/users/#{@current_user.user_name}")
      else
        redirect_to("/")
      end
    end
  end

end
