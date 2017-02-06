module NamecheapApi
  ENDPOINTS = {
    sandbox: 'https://api.sandbox.namecheap.com/xml.response',
    production: 'https://api.namecheap.com/xml.response'
  }

  class Client
    attr_reader :config

    def initialize(config)
      @config = config
      @sandbox = config[:sandbox]
    end

    def call(command, method, parameters = {})
      Response.new(new_request(command, method, parameters).call.body)
    end

    def endpoint
      @sandbox ? ENDPOINTS[:sandbox] : ENDPOINTS[:production]
    end

    private

    def new_request(command, method, parameters)
      Request.new(self, command, method, parameters)
    end
  end
end
