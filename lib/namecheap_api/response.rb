require 'nokogiri'

module NamecheapApi
  class Response
    attr_accessor :raw_body

    def initialize(body)
      @raw_body = body
    end

    def command
      doc.css('RequestedCommand').text
    end

    def results
      doc.css('CommandResponse > *').map do |result|
        clean_hash_keys(result.to_h)
      end
    end

    def doc
      @doc ||= Nokogiri::XML(raw_body)
    end

    private

    def clean_hash_keys(hash)
      hash.map do |key, value|
        clean_key = key
          .gsub(/(?:([A-Za-z\d])|^)()(?=\b|[^a-z])/) { "#{$1}#{$1 && '_'}#{$2.downcase}" }
          .chop
          .downcase.to_sym
        { clean_key => value }
      end.inject(:merge)
    end
  end
end
