Rails.application.routes.draw do
  root 'users#index'
  get '/login' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  resources :users
  resources :locations
  resources :events


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
