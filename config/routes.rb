Rails.application.routes.draw do

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
  resources :signup, only: [:index, :new, :create]
  resources :users, only: [:index, :edit, :update,:show]
  resources :items, only: [:new, :create, :index]
  resources :items do
    resources :orders, only:[:new, :create]
    member do
      get "order"
    end
    collection do
      get "search"
    end
  end
  resources :users do
    resources :item_order, only: :create
  end
  # resources :item_order, only: [:new, :create, :edit, :update]
end
