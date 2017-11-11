Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :events, only:[:new, :create]

  get '/create_event', to: 'events#new'

  post '/create_event', to: 'events#create'

  get '/signup', to: 'users#new'
  
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'
  
  root 'static_pages#home'
end
