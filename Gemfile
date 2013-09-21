# clean up:
# rm -rf ~/.bundle/ ~/.gem/; rm -rf $GEM_HOME/bundler/ $GEM_HOME/cache/bundler/; rm -rf .bundle/; rm -rf vendor/cache/; rm -rf Gemfile.lock

source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'
gem 'pg'

gem 'thin'

gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass-rails', :git => 'https://github.com/yabawock/bootstrap-sass-rails.git'
gem 'font-awesome-sass-rails'

gem 'cancan'
gem 'devise'
gem 'devise_invitable'

gem 'figaro'

gem 'rolify'
gem 'sendgrid'
gem 'simple_form', '>= 3.0.0.rc'

# Use unicorn as the app server
gem 'unicorn'

gem 'uglifier'
gem 'execjs'
gem 'sass-rails', '~> 4.0.0'

gem "toadhopper"
gem "hoptoad_notifier"

gem 'httparty'

# Ember
gem 'ember-rails'
gem 'ember-source', '1.0.0' # or the version you need

gem 'active_model_serializers' # Make Rails generate json that ember likes.

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'debugger'
  gem 'qunit-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
end
