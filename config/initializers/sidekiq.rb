rails_env = ENV['RAILS_ENV'] || 'development'


if rails_env =~ /production/
	Sidekiq.configure_server do |config|
	  config.redis = { :url => ENV['REDISTOGO_URL'] }
	end


	Sidekiq.configure_client do |config|
	  config.redis = { :url => ENV['REDISTOGO_URL'], :size => 1 }
	end
else
	Sidekiq.configure_server do |config|
	  config.redis = { :url => "redis://localhost:6379" }
	end


	Sidekiq.configure_client do |config|
	  config.redis = { :url => "redis://localhost:6379", :size => 1 }
	end  
end
