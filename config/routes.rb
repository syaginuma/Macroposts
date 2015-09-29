Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
<<<<<<< HEAD
  resources :relationships, only: [:create, :destroy]
=======
  resources :microposts
>>>>>>> user-profile
end
