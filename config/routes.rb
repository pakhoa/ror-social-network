Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts do
  	resources :comments
  end
  get "/newsfeed", to: 'home#newsfeed'
  root to: 'home#index'
end
