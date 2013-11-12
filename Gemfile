source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3', '~> 1.3.7'
  gem 'rspec-rails', '2.13.1'
  gem "factory_girl_rails", ">= 4.2.0"
end

group :development do
  gem "quiet_assets", ">= 1.0.1" #Quiet Assets turns off the Rails asset pipeline log
  gem "better_errors", ">= 0.3.2" #replaces the standard Rails error page with a much better and more useful error page
end

group :test do
  gem 'capybara', '2.1.0'
  gem "database_cleaner", ">= 0.9.1" #Database Cleaner is a set of strategies for cleaning your database in Ruby
  gem "email_spec", ">= 1.4.0" #A collection of matchers for RSpec/MiniTest and Cucumber steps to make testing emails go smoothly
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2" #Launchy is helper class for launching cross-platform applications in a fire and forget manner.
  gem "selenium-webdriver", ">= 2.34.0"
end

#group :production do
#  gem 'pg', '0.15.1'
#  gem 'rails_12factor', '0.0.2'
#end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3' # Ensure that your environment has a JavaScript interpreter supported by ExecJS

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'backbone-rails', '1.0.0.1'
  gem 'marionette-rails', '1.0.4'
  gem 'handlebars_assets', '0.14.1'
  gem 'i18n-js', '2.1.2'
end
gem "devise", ">= 2.2.3"
gem 'jquery-rails', '~> 3.0.4'
gem "haml-rails"
gem 'hamlbars', '~> 2.0'
gem 'bootstrap-sass', '2.3.2.0'
gem "figaro", ">= 0.5.3"
gem 'jbuilder', '~> 1.0.1'
gem 'cancan',  '~> 1.6.10'
gem 'state_machine', '~> 1.2.0'
gem 'ruby-graphviz', '~> 1.0.9', :require => 'graphviz' # Optional: only required for graphing

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
