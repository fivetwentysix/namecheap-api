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

    $ gem install namecheap-api --pre

## Usage

In Gemfile:

```ruby
gem 'namecheap-api'
```

Example:

```ruby
require 'namecheap-api'

config = {
  sandbox: true,
  client_ip: 'xxx.xxx.xxx.xxx',
  api_username: '<insert username>',
  username: '<insert password>',
  api_key: '<insert api key>'
}

client = NamecheapApi::Client.new(config)

client.call('namecheap.domains.check', :DomainList => 'domain1.com,domain2.com')
```

## Contributing

1. Fork it ( https://github.com/PatrickMa/namecheap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
