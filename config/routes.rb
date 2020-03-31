Rails.application.routes.draw do
  get 'mypages/show'
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

  resource :mypages, only: %i[show edit update] do
    collection do
      get :review
      get :like
    end
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
