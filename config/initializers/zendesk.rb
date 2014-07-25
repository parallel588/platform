require 'zendesk_api'

client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://basketo.zendesk.com/api/v2"

  # Basic / Token Authentication
  config.username = "spiros@basketo.co"

  # Choose one of the following depending on your authentication choice
  config.token = "gDBNhohAw3hxSQdnQTEjaewZzSRGDH5Tnd8P0O5F"
  config.password = "b@sk3t000"

  # OAuth Authentication
  config.access_token = "be64cffca3785ccee82cac9fa04e43b6cc6a8b5d540d73974dc1b2d76e1e6df0"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = { :ssl => false }

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end