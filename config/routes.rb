Rails.application.routes.draw do
  root 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/events/popular_events'

  resources :users
  resources :locations
  resources :events do
    resources :rsvp, only: :create, controller: 'events', action: 'rsvp'
  end

  resources :locations, only: [:show] do
    resources :events, only: [:index, :new]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
