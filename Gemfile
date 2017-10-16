source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'cancancan'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-i18n'
gem 'draper'
gem 'font-awesome-sass'
gem 'mysql2'
gem 'paper_trail'
gem 'rails', '~> 5.1.4'
gem 'rails-i18n'
gem 'redis'
gem 'rolify'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'telegram-bot'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'i18n-debug'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'puma', '~> 3.7'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'factory_girl'
  gem 'simplecov', require: false
end
