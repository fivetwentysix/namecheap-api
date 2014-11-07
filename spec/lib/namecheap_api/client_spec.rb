require 'namecheap_api/client'

describe NamecheapApi::Client do
  describe '#endpoint' do
    it 'returns sandbox endpoint if sandbox' do
      client = NamecheapApi::Client.new(sandbox: true)
      expect(client.endpoint).to eq(NamecheapApi::ENDPOINTS[:sandbox])
    end

    it 'returns production endpoint if not sandbox' do
      client = NamecheapApi::Client.new(sandbox: false)
      expect(client.endpoint).to eq(NamecheapApi::ENDPOINTS[:production])
    end
  end
end
