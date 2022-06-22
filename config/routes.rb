Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :destroy, :create, :new] 
  resources :recipes, only: [:index, :show, :create, :new, :destroy]
  
end
