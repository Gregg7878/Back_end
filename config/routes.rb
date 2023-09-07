Rails.application.routes.draw do
 
  resources :activities, only: [:index, :show, :create, :update, :destroy]
  
    post '/register', to: 'users#create'
  
    post '/login', to: 'sessions#create'
  
    delete '/logout', to: 'sessions#destroy'


end
