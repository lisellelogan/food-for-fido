Rails.application.routes.draw do
  root to: 'static#home'
  resources :users, only: [:new, :create, :show]
  resources :comments
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
