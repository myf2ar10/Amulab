Rails.application.routes.draw do

  namespace :public do
    get 'item_comments/create'
    get 'item_comments/destroy'
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'admin_top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update, :destroy] do

      member do
        patch :suspend
        patch :unsuspend
      end
    end
  end

  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
    # skip: [:passwords],
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  # ゲストユーザーログイン
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end




  scope module: :public do
    root 'homes#top', as: 'public_root'

    get 'about', to: 'homes#about', as: 'about'
    get 'privacypolicy', to: 'homes#index', as: 'privacypolicy'
    # get 'information', to: 'homes#create', as: 'information'コメントアウト
    patch 'information/:id', to: 'homes#information', as: 'information_send'
    # get 'complition', to: 'homes#complition', as: 'complition'コメントアウト
    get '/search', to: 'searches#search'


    resources :contacts, only: [:new, :create]
    get 'complition', to: 'contacts#complition'
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'

    resources :items, only: [:index, :show, :edit, :update, :create, :new] do
      resources :item_comments,only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      end

    resources :genres, only: [:index]
    resources :users, only: [:show]

    # resources :item_images, only: [:new, :create, :index, :show, :destroy] do
    #     resource :favorites, only: [:create, :destroy]
    # end

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