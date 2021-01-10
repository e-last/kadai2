Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'

  get "home/about" => "homes#about"


  resources :books, only: [ :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member
  end
  
end