source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Deploy with Capistrano
# gem 'capistrano'



# To use debugger
group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'livereload'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'spork', '> 0.9.0.rc'
  gem 'guard-spork'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
