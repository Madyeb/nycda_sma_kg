Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :students
  resources :users, only: [:new, :create]
  resources :projects, only: [:new, :create]
  resources :courses
end
