# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "bootsnap", ">= 1.4.4", require: false
gem "bootstrap", "~> 5.0.0.beta2"
gem "capybara"
gem "draper"
gem "jbuilder", "~> 2.7"
gem "jquery-rails"
gem "kaminari"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.3"
gem "rubytree"
gem "sass-rails", ">= 6"
gem "sqlite3", "~> 1.4"
gem "turbolinks", "~> 5"
gem "view_component", require: "view_component/engine"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "database_cleaner"
  gem "rspec-rails"
  gem "simplecov"
end
