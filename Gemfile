source 'http://rubygems.org'

gem "bundler", "~>1.3.5"

gem "rails", "3.2.15"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3-ruby', :require => 'sqlite3'
gem "mysql2", "~>0.3.11"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~>3.2.5'
  gem 'uglifier', '~>2.2.1'
  gem 'therubyracer'
end

gem "jquery-rails", "~>3.0.4"
gem "haml", "~>4.0.0"
gem "rdiscount", "~>2.1.6"
gem "pdfkit", "~>0.5.2"
gem "daemons", "~>1.1.9"
gem "delayed_job", "~>4.0.0"
gem "delayed_job_active_record", "~>4.0.0"
gem "exception_notification_rails3", "~>1.2.0", :require => 'exception_notifier'
gem "cancan", "~>1.6.7"
gem "state_machine", "~>1.2.0"
gem "fastercsv", "~>1.5.4", :platforms => :ruby_18

gem "nokogiri", "~>1.5.9" # Nokogiri => 1.6 has dropped support for Ruby 1.8.

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :development do
  gem "capistrano", "~>2.14.2"
  gem "railroad"
  gem "ruby-debug", :platforms => :ruby_18, :require => nil
  gem "ruby-debug19", :platforms => :ruby_19
  gem 'pry'
end

group :development, :test do
  gem "rspec-rails", "~>2.14.0"
  gem "webrat"
  gem "machinist", :git => "git://github.com/chrismear/machinist.git", :branch => "make_on_has_many"
  gem "faker", '~>1.2.0'
  gem "rcov", :platforms => :ruby_18
  gem "simplecov", :platforms => :ruby_19
  gem "coveralls", :require => false
  gem "cucumber-rails", "~>1.4.0", :require => nil
  gem "capybara", "~>1.1.2" # Capybara => 2.0.0 has dropped support for Ruby 1.8.x
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver", "~>2.35.1"
end
