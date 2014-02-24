source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

group :production do
    gem 'pg'
    gem 'dm-postgres-adapter'
end

group :development, :test do
    gem 'sqlite3'
    gem 'dm-sqlite-adapter'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Authentication
gem 'devise',              github: 'plataformatec/devise'
gem 'responders',          github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack'
gem 'activeadmin',         github: 'gregbell/active_admin'
gem 'formtastic',          github: 'justinfrench/formtastic'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'protected_attributes'
gem 'certified'
gem 'cancan'
gem 'data_mapper'

group :development do
  gem 'meta_request'
  gem 'better_errors', git: 'https://github.com/charliesome/better_errors.git'
  gem 'binding_of_caller'
end

gem 'bootstrap-sass', '~> 3.1.1'
gem 'font-awesome-rails'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails'
  gem 'rails-erd'
end

group :test do
  gem 'factory_girl_rails'
end
