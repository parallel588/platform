source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'




# basketo basics
gem 'devise'
gem 'devise-async'
gem "cancan"
gem 'protected_attributes'
gem 'sidekiq'
gem 'simple_form'
gem 'country_select'
gem 'carrierwave'
gem 'unf'
gem 'fog'
gem 'mini_magick'



# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

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

group :development do
  # gem 'rack-mini-profiler'
end
gem 'dotenv-rails', :groups => [:development, :test]


# TEST SUITE - http://railscasts.com/episodes/275-how-i-test?view=asciicast
# Faster Tests witih SPork: http://railscasts.com/episodes/285-spork?view=asciicast
gem 'rspec-rails'
group :test do
  gem 'guard-rspec'
  gem 'capybara'
  gem "factory_girl_rails"
  gem 'rb-fsevent'
  gem 'spork', :github => 'sporkrb/spork'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem "guard-spork"
  gem "launchy"
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production # needed for heroku: https://devcenter.heroku.com/articles/getting-started-with-rails4

