Rails.application.routes.draw do
  root to: 'static#home'
  resources :comments

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :recipes do 
    resources :comments, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
