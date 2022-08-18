# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index edit update]
  resources :hotels do
    post 'add_images'
    delete 'destroy_image/:id', to: 'hotels#destroy_img', as: 'image'
    match 'main_image/:id', to: 'hotels#set_main_image', as: 'main_image', via: %i[get match]
    resources :rooms, only: %i[new create edit update destroy]
  end
  resources :reservations, only: %i[index new create destroy]
  resources :reviews, only: %i[new create destroy]
  # Defines the root path route ("/")
  root to: 'hotels#index'
end
