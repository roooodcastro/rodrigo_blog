# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  resources :users, only: [:show]

  namespace :blog do
    resource :blog, only: [:show], path: '/', as: :feed
    resources :articles
  end
end
