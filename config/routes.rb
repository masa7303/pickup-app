Rails.application.routes.draw do
  root to: 'tasks#index'

  # ログインまわり
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'search', to: 'tasks#search'

  get 'shops/search', to: 'shops#search'

  get 'users/search', to: 'admin/users#search'

  resources :tasks do
    resources :comments, only: %i[index create edit], shallow: true
  end

  namespace :mypage do
    get :reviews
    get :shops
    get :profile
    get :email
    get :password
  end
  
  scope :mypage do
    resources :dashboard, only: %i[index]
    resources :profiles, only: %i[update]
    resources :email, only: %i[update]
    resources :password, only: %i[update]
  end

  resources :relationships, only: [:create, :destroy]

  resources :likes, only: [:create, :destroy]

  resources :shops do
    resources :reviews, shallow: true
  end

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
