Rails.application.routes.draw do
  root to: "criptocurrency_histories#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :criptocurrency_histories
  resources :criptocurrencies
  resources :users
end
