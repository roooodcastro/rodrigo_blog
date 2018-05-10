# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'blog#show'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, except: [:new, :create]

  resource :blog, only: [:show], path: '/', as: :feed
  resources :articles
  resources :comments, only: [:create, :update, :destroy]
  resources :tags
end
