Rails.application.routes.draw do
  get 'static_pages/term'
  get 'static_pages/privacy'
  root to: 'home#index'

  # ログインまわり
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #メール機能
  get 'inquiry', to: 'inquiry#index'              # 入力画面
  post 'inquiry/confirm', to: 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks', to: 'inquiry#thanks'     # 送信完了画面

  get 'search', to: 'tasks#search'

  get 'shops/search', to: 'shops#search'

  get 'users/search', to: 'admin/users#search'

  get 'reviews', to: 'reviews#index'

  get 'term', to: 'static_pages#term'

  get 'privacy', to: 'static_pages#privacy'

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
