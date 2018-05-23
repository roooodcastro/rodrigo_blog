# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'blog/home#show'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, except: [:new, :create]

  constraints subdomain: 'blog' do
    scope module: 'blog' do
      resources :home, only: [:show], path: '/', as: :feed
      resources :articles, as: :blog_articles
      resources :comments, only: [:create, :update, :destroy],
                as: :blog_comments
      resources :tags, as: :blog_tags
    end
  end
end
