Rails.application.routes.draw do

  get 'search' ,          to: 'microposts#search',  as: 'search'
  get 'search/:keyword' , to: 'microposts#search',  as: 'search_keyword'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get    'users/:id/followings' , to: 'users#followings' , as: 'followings'
  get    'users/:id/followers'  , to: 'users#followers'  , as: 'followers'

  resources :users
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end