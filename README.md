# NamecheapApi

a Ruby gem for working with the Namecheap API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'namecheap-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install namecheap-api

## Usage

Example:

```ruby
require 'namecheap_api'

config = {
  sandbox: true,
  client_ip: 'xxx.xxx.xxx.xxx',
  api_username: '<insert username>',
  username: '<insert password>',
  api_key: '<insert api key>'
}

client = NamecheapApi::Client.new(config)
response = client.call('namecheap.domains.check', :DomainList => 'domain1.com,domain2.com')
```

You can call on NamecheapApi::Response#results to get your results.

`response.results` returns:

```ruby
[
  {:domain=>"domain1.com", :available=>"true", :error_no=>"0", :description=>""},
  {:domain=>"domain2.com", :available=>"false", :error_no=>"0", :description=>""}
]
```

## Contributing

1. Fork it ( https://github.com/PatrickMa/namecheap-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
