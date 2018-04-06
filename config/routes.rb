# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'blog/blog#show'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, except: [:new, :create]

  namespace :blog do
    resource :blog, only: [:show], path: '/', as: :feed
    resources :articles
    resources :tags
  end
end
