class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}

  def top
    posts = Post.all.order(created_at: :desc)
    select_posts = posts.select do |x|
      x.isbn_code.present?
    end
    @recently_posts = select_posts
    @books = Book.all
  end

  def about
  end

end