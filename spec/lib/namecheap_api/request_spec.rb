require 'namecheap_api/request'

describe NamecheapApi::Request do
  let(:config) do
    {
      api_username: 'tester',
      api_key: 'sample api key',
      username: 'tester_username',
      client_ip: '127.0.0.1'
    }
  end
  let(:client) { double('Client', config: config, endpoint: 'something.com') }
  let(:params) { { param1: 'param1' } }
  let(:request) { NamecheapApi::Request.new(client, 'example.command', params) }

  describe '#request' do
    it { expect(request.request).to be_a(Typhoeus::Request) }
  end

  describe '#call' do
    it 'delegates to Typhoeus::Request#run' do
      expect_any_instance_of(Typhoeus::Request).to receive(:run)
      request.call
    end
  end

  describe '#request_parameters' do
    it "contains 'ApiUser' with config[:api_username] value" do
      expect(request.request_parameters[:ApiUser]).to eq(config[:api_username])
    end

    it "contains 'ApiKey' with config[:api_key] value" do
      expect(request.request_parameters[:ApiKey]).to eq(config[:api_key])
    end

    it "contains 'UserName' with config[:username] value" do
      expect(request.request_parameters[:UserName]).to eq(config[:username])
    end

    it "contains 'Command' with command value" do
      expect(request.request_parameters[:Command]).to eq('example.command')
    end

    it "contains 'ClientIp' with config[:client_ip] value" do
      expect(request.request_parameters[:ClientIp]).to eq(config[:client_ip])
    end

    it "merges params with the request_parameters" do
      expect(request.request_parameters[:param1]).to eq(params[:param1])
    end
  end

  describe '#config' do
    it 'delegates to client' do
      expect(request.config).to eq(config)
    end
  end
end
