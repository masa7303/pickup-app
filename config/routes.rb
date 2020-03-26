Rails.application.routes.draw do
  root to: 'tasks#index'

  # ログインまわり
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'search', to: 'tasks#search'

  get 'users/search', to: 'admin/users#search'

  resources :tasks do
    resources :comments
  end

  resources :users do
    resource :relationships, only: %i[create destroy]
  end

  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
