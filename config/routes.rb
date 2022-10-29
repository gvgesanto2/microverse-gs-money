Rails.application.routes.draw do
  devise_for :users

  resources :users
  
  resources :categories, only: [:index, :create, :new, :destroy] do
    resources :money_transactions, only: [:index] 
  end

  get '/money_transactions', to: 'money_transactions#all_transactions'

  resources :money_transactions, only: [:create, :destroy] 

  root "money_transactions#all_transactions"
end
