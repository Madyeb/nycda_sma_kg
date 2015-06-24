Rails.application.routes.draw do
  root 'students#index'

  resources :students
  resources :users, only: [:new, :create]

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'

  # resources :sessions
end
