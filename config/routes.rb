Rails.application.routes.draw do
  devise_for :users
          #'controller#action'
  root to: 'items#index'
  resources :items do
    resources :address, only: :create
    collection do
      get 'search'
    end
  end
  # resources :users, only: :show
# end
  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'address'
    end
  end
end 