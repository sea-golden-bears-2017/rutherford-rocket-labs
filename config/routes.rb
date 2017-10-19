Rails.application.routes.draw do

  resources :parts, only: ["index"]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "orders#index"
  resources :orders, only: [:index, :show, :update]

  resources :orders_parts, only: :update
end
