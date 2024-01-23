# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in routes_lazy_routes.gemspec
gemspec

if ENV['RAILS_VERSION'] == 'edge'
  gem 'rails', git: 'https://github.com/rails/rails.git'
elsif ENV['RAILS_VERSION']
  gem 'rails', "~> #{ENV['RAILS_VERSION']}.0"
end

gem "rake", "~> 13.0"

gem "minitest", "~> 5.0"

gem 'base64'
gem 'bigdecimal'
gem 'mutex_m'
