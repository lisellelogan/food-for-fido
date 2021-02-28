Rails.application.routes.draw do
  root to: 'static#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :recipes do 
    resources :comments, only: [:index, :new, :create]
  end

  scope '/admin' do 
    resources :recipes, except: [:show, :index] 
  end

  resources :comments, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
