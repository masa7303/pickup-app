Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/edit'
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

  resources :relationships, only: [:create, :destroy]

  resources :shops, only: %i[index show] do
    resources :reviews, only: %i[index create edit update destroy], shallow: true
  end

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
