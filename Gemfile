source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'pg', '~> 0.18.4'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'slack-ruby-client'

gem 'celluloid-io', require: ['celluloid/current', 'celluloid/io']

gem 'foreman'

gem 'sidekiq' # for background jobs
gem 'sinatra', require: false # for web interface of sidekiq
gem 'slim'    # for web interface of sidekiq
gem 'sidekiq_remove_scheduled' # To remove scheduled sidekiq jobs

gem 'hirb', '0.7.3' # better indentation in irb


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
