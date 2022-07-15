# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index edit update]
  resources :hotels do
    resources :rooms, only: %i[new create edit update destroy]
  end
  resources :reservations, only: %i[index new create destroy]
  # Defines the root path route ("/")
  root to: 'hotels#index'
end
