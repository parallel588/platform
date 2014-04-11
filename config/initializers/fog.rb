CarrierWave.configure do |config|
  
  if ENV['RAILS_ENV'] =~ /test/
    config.storage = :file
  else
  
  config.fog_credentials = {
    :path_style             => true,
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                       # required
    :region                 => ENV['REGION'],                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['BUCKET_NAME']                     # required
  config.fog_public     = true                                   # optional, defaults to true    
  config.asset_host     = "http://heroku.basketo.development.s3.amazonaws.com"
  # config.asset_host     = ENV['CLOUDFRONT_FULL_URL'] 
  config.fog_attributes = { 'Cache-Control'=>'max-age=315576000', 'Expires' => 1.week.from_now.httpdate }
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
