Rails.application.routes.draw do

  # home controller
  get "/" => "home#top"
  get "about" => "home#about"

  # users controller
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#new"
  post "users/create" => "users#create"
  
  get "login" => "users#login_form"
  post "login" => "users#login"

  # posts controller
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "ranking" => "posts#ranking"
  get "favorite" => "posts#favorite"

end
