Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' 
  resources :tweets do
    resources  :comments, only: [:create]    
  end
  get "users/index" => "users#index"
  resources :users, only: [:show,:edit,:update] 
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  get "home" => "home#top"
  get 'about' => 'home#about'
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  #フォローとフォローを外すアクション
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  patch 'users/nonrelease/:user_id' => 'users#nonrelease'
  patch 'users/release/:user_id' => 'users#release'
end
