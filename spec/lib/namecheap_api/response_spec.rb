require 'namecheap_api/response'

describe NamecheapApi::Response do
  # See: spec/fixtures/namecheap_domains_check.xml
  let(:body) { load_fixture('namecheap_domains_check') }

  let(:response) { NamecheapApi::Response.new(body) }

  describe '#initialize(body)' do
    it 'assigns body to @raw_body' do
      expect(response.raw_body).to eq(body)
    end
  end

  describe '#command' do
    it "returns value of 'RequestedCommand'" do
      expect(response.command).to eq('namecheap.domains.check')
    end
  end

  describe '#results' do
    it 'returns a array of hashes' do
      expectation = [
        { domain: "domain1.com", available: "false", error_no: "0", description: "" },
        { domain: "domain2.com", available: "false", error_no: "0", description: "" }
      ]
      expect(response.results).to eq(expectation)
    end
  end

  describe '#doc' do
    it { expect(response.doc).to be_a(Nokogiri::XML::Document) }
  end
end
