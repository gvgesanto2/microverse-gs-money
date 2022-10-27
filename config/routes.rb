Rails.application.routes.draw do
  devise_for :users
  resources :money_transactions
  resources :categories

  root "categories#index"
end
