Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'admin_top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    # skip: [:passwords],
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top', as: 'public_root'

    get 'about', to: 'homes#about', as: 'about'
    get 'privacypolicy', to: 'homes#index', as: 'privacypolicy'
    get 'information', to: 'homes#create', as: 'information'
    patch 'information/:id', to: 'homes#information', as: 'information_send'
    get 'complition', to: 'homes#complition', as: 'complition'
    get '/search', to: 'searches#search'

    resources :items, only: [:index, :show, :edit, :update, :create, :new]
    resources :genres, only: [:index]
    resources :users, only: [:show]

      resources :items do
        resource :favorites, only: [:create, :destroy]
      end
  end

end
  # namespace :admin do
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/update'
  # end
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/create'
  #   get 'genres/edit'
  #   get 'genres/update'
  # end
  # namespace :admin do
  #   get 'items/index'
  #   get 'items/show'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end

  # namespace :public do
  #   get 'users/show'
  # end
  # namespace :public do
  #   get 'genres/index'
  # end
  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'
  #   get 'items/edit'
  #   get 'items/update'
  #   get 'items/create'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  #   get 'homes/index'
  #   get 'homes/create'
  #   get 'homes/information'
  #   get 'homes/complition'
  # end

  # devise_for :admins
  # devise_for :users

  # # 顧客用
  # # URL /customers/sign_in ...
  # devise_for :customers, controllers: {
  #   registrations: "public/registrations",
  #   sessions: 'public/sessions'
  # }
  # # 管理者用
  # # URL /admin/sign_in ...
  # devise_for :admin, controllers: {
  #   sessions: "admin/sessions"
  # }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html