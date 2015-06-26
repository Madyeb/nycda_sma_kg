Rails.application.routes.draw do
  root 'home#index'

  resources :students
  resources :users, only: [:new, :create]
  resources :projects, only: [:new, :create]

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

  # resources :sessions
end
