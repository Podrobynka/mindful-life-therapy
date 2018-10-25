source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.1'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'mini_magick', '~> 4.8'
gem 'aws-sdk-s3', require: false
gem 'bootsnap', '>= 1.1.0', require: false
gem 'foundation-rails'
gem 'font-awesome-sass', '~> 5.3.1'
gem 'haml-rails'
gem 'sucker_punch'
gem 'geocoder'
gem 'uk_postcode'
gem 'google_sign_in'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'simplecov', require: false
  gem 'mocha'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rack-timeout'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.5.1'
