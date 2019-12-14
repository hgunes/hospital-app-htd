# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :doctors
      resources :patients

      root to: "users#index"
    end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/patients')
  resources :patients
  resources :doctors
end
