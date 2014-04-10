Devise::Async.setup do |config|
  config.backend = :sidekiq
  config.queue   = :devise_subscriptions_queue
end
