source 'https://rubygems.org'

ruby "2.4.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                       '~> 5.1'
# Require 'roo for CSV and Excell upload and download
gem 'roo'
# Require SendGrid gem to send mail -- This is in app.sendgrid.com/guide/integrate/langs/ruby
gem 'sendgrid-ruby'
# Require iconv for excell file manipulation
gem 'iconv'
# To avoid "`require': cannot load such file -- bootsnap/setup (LoadError)"
#  as per "https://stackoverflow.com/questions/51493625/new-to-rails-rails-server-error-cannot-load-such-file-bootsnap-setup-load"
gem 'bootsnap'
# Use bcrypt to encode password hashes
gem 'bcrypt',                      '3.1.11'
# Use birthday gem to check members table
#  THIS GEM IS RUBBISH, NEVER DID WORK FOR ME
# gem 'birthday',                    '~> 0.3.0'
# use faker to fill development database
gem 'faker',                       '1.6.6'
# Use will-paginate to divide users listing into pages
gem 'will_paginate',               '~> 3.1.0'
gem 'bootstrap-will_paginate',     '~> 0.0.10'
# Use Bootstrap-sass for responsive site
gem 'bootstrap-sass',              '~> 3.4.1'
# use simple calendar github.com/excid3/simple_calendar
gem 'simple_calendar',             '~> 2.0'
# Use Puma as the app server
gem 'puma',                        '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails',               '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                 '3.0.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',             '~> 4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails',             '4.1.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks',               '5.0.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder',                 '~> 2.6.4'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3',                '1.3.12'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',                 '9.0.0', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console',            '3.1.1'
  gem 'listen',                 '3.0.8'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring',                 '1.7.2'
  gem 'spring-watcher-listen',  '2.0.0'
  # Use pry as rails console
  gem 'pry-rails'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0.3'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
