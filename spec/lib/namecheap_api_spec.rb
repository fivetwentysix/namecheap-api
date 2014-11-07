require 'namecheap_api'

describe NamecheapApi do
  it 'can check the availability of domains' do
    config = {
      sandbox: true,
      client_ip: 'xxx.xxx.xxx.xxx',
      api_username: '<insert username>',
      username: '<insert password>',
      api_key: '<insert api key>'
    }

    client = NamecheapApi::Client.new(config)
    response = client.call('namecheap.domains.check', :DomainList => 'domain1.com,domain2.com')
    expect(response).to be_a(NamecheapApi::Response)
  end
end
