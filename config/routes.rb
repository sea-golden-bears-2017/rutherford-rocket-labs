Rails.application.routes.draw do

  resources :parts, only: ["index"]
  
end
