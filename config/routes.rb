Rails.application.routes.draw do
  devise_for :users
          #'controller#action'
  root to: 'items#index'
  resources :signup, only: [:index, :create]
  resources :users, only: [:index, :edit, :update,:show]
  resources :items, only: [:index,:new, :create, :edit, :update] do
    member do
      get "purchase_confirmaiton"
    end

    collection do
      get "search"
    end
  end
  resources :address, only: [:new, :create, :edit, :update]

  resources :users do
    resources :address, only: :create
  end



end
