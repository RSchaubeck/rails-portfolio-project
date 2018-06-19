Rails.application.routes.draw do
  root 'users#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'

  resources :locations, only: [:show] do
    resources :events, only: [:show, :index]
  end
  resources :users
  resources :locations
  resources :events


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
