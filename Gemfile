source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

#i18n internacionalização
gem 'rails-i18n'
#Rails gem of the Bootstrap based admin theme SB Admin 2. 
gem 'bootstrap_sb_admin_base_v2'
#Kaminary
gem 'kaminari'
#A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps
gem 'kaminari-i18n'
#bootstrap-select-rails
gem 'bootstrap-select-rails'
#Integration of RubyMoney - Money with Rails
gem 'money-rails', '~>1'
# Devise - Flexible authentication solution for Rails with Warden. 
gem 'devise'
gem 'devise-i18n'
# Generate Entity-Relationship Diagrams for Rails applications
gem 'rails-erd'
#
gem 'maskedinput-rails'
#Let's say you want a list of students that can be filtered by your app's users.
gem 'filterrific'
# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'
# An awesome replacement for JavaScript's alert.
gem 'sweetalert-rails'
#A Really Ruby Mail Library
gem 'mail'
#Help ActiveRecord::Enum feature to work fine with i18n.
gem 'enum_i18n'


# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #Faker
  gem 'faker'
  #Ruby probressbar in terminal for long running jobs
  gem 'rake-progressbar'
  #Generates Brazilian CPF numbers for use in testing.
  gem 'cpf_faker'
  #Better error page for Rack apps
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do 
  
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
