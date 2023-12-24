# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
#

gem 'dotenv-rails'
gem 'ransack'
gem 'warden'
gem 'devise'
gem 'smarter_csv', require: false
gem 'acts-as-taggable-on'
gem 'cancancan'
gem 'axlsx', github: 'randym/axlsx', branch: 'master'
gem 'sentry-ruby'
gem 'nokogiri'
gem 'rubyzip', '1.3.0'

# Frontend
gem 'slim-rails'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'bootstrap-datepicker-rails'

# Use Sass to process CSS
gem "sassc-rails"

gem 'uglifier'
gem 'coffee-rails'
gem 'font-awesome-rails'
gem 'therubyracer'
gem 'jquery-rails'
gem 'select2-rails'
gem 'jquery-ui-rails'
gem 'rails-jquery-autocomplete'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false

  # Patch-level verification for bundler.
  gem "bundler-audit"

  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  gem "brakeman"

  # Use RSpec for specs
  gem "rspec-rails", ">= 3.5.0"
  gem "factory_bot_rails"
  gem "faker"
  gem "ffaker"

  gem 'rb-readline'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem "byebug"

  # The Bullet gem is designed to help you increase your application's performance by reducing the number of queries it makes.
  gem "bullet"

  # Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
  gem "annotate"

  # With this gem you can easily see which translations are being looked up.
  # gem "i18n-debug"

  gem 'letter_opener'
end

group :production do

end


group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

  gem 'database_rewinder'
end

gem 'mini_portile2', '~> 2.8', '>= 2.8.1'
