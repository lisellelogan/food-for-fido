Rails.application.routes.draw do
  root to: 'static#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/recipes_ordered_by_alphabetical_order', to: 'recipes#recipes_alphabetical_order'
  get 'recipes_ordered_by_fastest_cook_time', to: 'recipes#recipes_fastest_cook_time'
  get 'recipes_ordered_by_recently_created', to: 'recipes#recipes_recently_created'

  resources :recipes do 
    resources :comments, only: [:index, :new, :create]
  end

  scope '/admin' do 
    resources :recipes, except: [:show, :index] 
  end

  resources :comments, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
