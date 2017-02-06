require 'typhoeus'

module NamecheapApi
  class Request
    def initialize(client, command, method, command_parameters = {})
      @client = client
      @command = command
      @method = method
      @command_parameters = command_parameters
    end

    def call
      request.run
    end

    def request
      Typhoeus::Request.new(@client.endpoint,
                            method: @method,
                            params: request_parameters)
    end

    def request_parameters
      {
        :ApiUser => config[:api_username],
        :ApiKey => config[:api_key],
        :UserName => config[:username],
        :ClientIp => config[:client_ip],
        :Command => @command
      }.merge(@command_parameters)
    end

    def config
      @client.config
    end
  end
end
