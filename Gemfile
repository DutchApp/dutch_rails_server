source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'bootstrap-sass'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'annotate'

  # Debugging gems
  #gem 'ruby-debug19'
  #gem 'ruby-debug-ide'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails', '4.2.1'
  gem 'faker', '1.1.2'
  gem 'populator'
end

group :test do
  gem 'shoulda-matchers', '2.3.0'
  gem 'simplecov', require: false
  gem 'capybara'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end


group :production do
  gem 'pg', '0.16.0'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails'

# Devise Integration
gem 'devise'
gem 'devise_header_token' # To enable auth token in header

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
