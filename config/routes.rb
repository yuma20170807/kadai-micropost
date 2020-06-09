Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      #-----課題-----
      get :favoritings
      #--------------
    end
  end

  resources :microposts, only: [:create, :destroy] do
    #-----課題-----
    member do
      get :favoriters
    end
  end
    #--------------
  resources :relationships, only: [:create, :destroy]
  
  #-----課題-----
  resources :favorites, only: [:create, :destroy]
  get 'user/:id/likes', to: 'users#favoritings', as:'likes'
  #--------------
end