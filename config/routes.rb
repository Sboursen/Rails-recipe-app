Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy]
  resources :public_recipes, only: [:index]
  resources :shopping_lists, only: [:index]
  root "public_recipes#index"
end
