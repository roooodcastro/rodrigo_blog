# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.0'

gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0.beta2'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.0.0'
gem 'faker'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rubocop'
  gem 'sandi_meter', require: false,
      git: 'https://github.com/roooodcastro/sandi_meter',
      branch: 'one-line-method-fix'
end

group :development do
  gem 'awesome_print'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'rspec-html-matchers'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end
