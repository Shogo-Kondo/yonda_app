Rails.application.routes.draw do

  get "/" => "home#top"
  get "about" => "home#about"

  get 'user/index'
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"


  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/edit" => "posts#edit"


end
