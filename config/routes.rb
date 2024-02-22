Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only:[:index, :new, :create]
  end
  #resources :purchase_customers, only:[:new, :create]
end
