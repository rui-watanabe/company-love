Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index' 
  resources :tweets do
    resources  :comments, only: [:create]    
  end
  get "users/index" => "users#index"
  resources :users, only: [:show,:edit,:update] 
  get "home" => "home#top"
  get 'about' => 'home#about'
end
