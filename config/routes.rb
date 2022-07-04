# frozen_string_literal: true

Rails.application.routes.draw do
  get 'hotels/index'
  get 'hotels/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index edit update]
  # Defines the root path route ("/")
  root to: 'hotels#index'
end
