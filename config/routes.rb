Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users , controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"  
  } 
  root to: "items#index"
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'complete_signup'
    end
  end

  resources :signin ,only: [:new, :create, :index]
  resources :articles
  resources :signup, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update,:show]
  resources :items, only: [:index, :new, :create, :edit, :update] do
    member do
      get "purchase_confirmaiton"
    end

    collection do
      get "search"
    end
  end

  resources :address, only: [:new, :create, :edit, :update] do
  end

  resources :users do
    resources :address, only: :create
  end
end
