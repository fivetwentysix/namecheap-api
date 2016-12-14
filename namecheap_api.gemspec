# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'namecheap_api/version'

Gem::Specification.new do |spec|
  spec.name          = "namecheap-api"
  spec.version       = NamecheapApi::VERSION
  spec.authors       = ["Patrick Ma", "Marc Wickenden"]
  spec.email         = ["code@4armed.com"]
  spec.summary       = "a Gem for interacting with the Namecheap API"
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/4ARMED/namecheap-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "simplecov"
  spec.add_dependency "typhoeus", "~> 0.6"
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "activesupport", "~> 4.2"
end
