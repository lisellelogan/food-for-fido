Rails.application.routes.draw do
  root to: 'static#home'
  resources :users, only: [:new, :create, :show]
  resources :recipes
  resources :comments

  get '/login' to: 'sessions#new'
  post '/login' to: 'sessions#create'
  delete '/logout' to: 'sessions#destroy'

  get '/signup' to: 'users#new'
  post '/signup' to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
