[![Code Climate](https://codeclimate.com/github/Basketo/platform.png)](https://codeclimate.com/github/Basketo/platform)


== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
rvm install ruby-2.0

* System dependencies
brew install pg
brew install imagemagick

* Configuration

* Database creation


* Database initialization

* How to run the test suite
RAILS_ENV=test bundle exec rake db:migrate
guard


* Services (job queues, cache servers, search engines, etc.)
bundle exec sidekiq -e development -C ./config/sidekiq.yml

* Deployment instructions
git push heroku master

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
