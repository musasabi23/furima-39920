Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :index]
    resources :delivery_cost, only: [:index]
  
end
