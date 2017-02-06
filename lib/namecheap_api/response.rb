require 'nokogiri'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/core_ext/hash/conversions'

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
      result_elements.map do |result|
        clean_hash_keys(result.to_h)
      end
    end

    def result_elements
      doc.css(result_finder)
    end

    def doc
      @doc ||= Nokogiri::XML(raw_body)
    end

    private

    def result_finder
      case command
      when /namecheap\.domains\.get(l|L)ist/
        'DomainGetListResult > Domain'
      when /namecheap\.domains\.dns\.get(h|H)osts/
        'DomainDNSGetHostsResult > host'
      else
        'CommandResponse > *'
      end
    end

    def clean_hash_keys(hash)
      hash.map do |key, value|
        { key.underscore.to_sym => value }
      end.inject(:merge)
    end
  end
end
