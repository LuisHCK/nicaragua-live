source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0.rc1'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'sprockets'
# Use jquery as the JavaScript library
#gem 'jquery-rails'
gem 'jquery-rails', git: 'https://github.com/rails/jquery-rails.git'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'record_tag_helper', '~> 1.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "better_errors"

  gem "binding_of_caller"

  # Use mysql as the database for Active Record
  gem 'mysql2', '>= 0.3.13', '< 0.5', require: false

  #Auto reload
  gem 'guard-livereload', require: false
end

#Migrate to bootstrap 3
gem 'bootstrap-sass'


group :production do
	gem 'rails_12factor'
	gem 'pg'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'puma'
end
#Custom gems
gem 'devise'
gem 'paperclip'
gem 'jquery-turbolinks'
gem 'redcarpet'
gem 'will_paginate'
gem 'searchkick'
gem "survey", "~> 0.1", github: "LuisHCK/survey"
gem 'tzinfo-data'
gem 'tzinfo'
gem 'simple_form'
gem 'mailboxer'
gem 'aasm'
gem "lazyload-rails", github: "techbang/lazyload-rails"
gem "omniauth"
gem "omniauth-facebook"
gem 'social-share-button', git: 'https://github.com/jmjurado23/social-share-button.git'
