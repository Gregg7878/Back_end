Rails.application.routes.draw do
 
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :activities, only: [:index, :show, :create, :update, :destroy]

end
