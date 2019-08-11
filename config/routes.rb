Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' 
  resources :tweets do
    resources  :comments, only: [:create]    
  end
  get "users/index",to: "users#index"
  resources :users, only: [:show,:edit,:update] 
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  get "home",to: "home#top"
  get "about",to: "home#about"
  put 'users/follow/:user_id',to: 'users#follow'
  put 'users/unfollow/:user_id',to: 'users#unfollow'
  get 'users/follow_list/:user_id',to: 'users#follow_list'
  get 'users/follower_list/:user_id',to:'users#follower_list'
  patch 'users/nonrelease/:user_id',to:'users#nonrelease'
  patch 'users/release/:user_id',to: 'users#release'
end
