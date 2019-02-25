Rails.application.routes.draw do
  root to: "products#index"

  resources :products, only: [:index]

  devise_for :users

  resources :users, only: [] do
    collection do
      get :upgrade_information
    end

    member do
      put :upgrade
    end
  end

  namespace :admin do
    resources :products
    resources :users, only: [:index, :show, :edit, :update]
  end
end
