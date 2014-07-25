class ZendeskController < ApplicationController

  def test

    # TODO: WHERE THE FUCK DOES THIS CODE GO???
    client = ZendeskAPI::Client.new do |config|
      # Mandatory:
      config.url = "https://basketo.zendesk.com/api/v2"

      # Basic / Token Authentication
      config.username = "spiros@basketo.co"

      # Choose one of the following depending on your authentication choice
      # config.token = "kXC5XCzwaNnQscT4vaEnUqwtT42Ieo6SNZzfzqaa"
      config.password = "b@sk3t000"

      # OAuth Authentication
      # config.access_token = "f498f602fd2f2efc1e098786a22e7853a5c4d9359c58320b10736c407df51984"

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




    @tickets = client.tickets
  end
  
end
