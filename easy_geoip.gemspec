# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "easy_geoip/version"

Gem::Specification.new do |spec|
  spec.name          = "easy_geoip"
  spec.version       = EasyGeoIP::VERSION
  spec.authors       = ["Gordon Chan"]
  spec.email         = ["developer.gordon@gmail.com"]

  spec.summary       = "A small, simple, and easy to use IP geolocation client."
  spec.description   = "A common Ruby interface for various free IP geolocation
    services. Small, simple and easy to use."
  spec.homepage      = "https://www.github.com/gchan/easy_geoip"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] +
    %w(CHANGELOG.md LICENSE README.md CONTRIBUTING.md CODE_OF_CONDUCT.md
       easy_geoip.gemspec)
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.platform      = Gem::Platform::RUBY

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_runtime_dependency "faraday", "~> 0.9.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10.1"

  spec.add_development_dependency "minitest", "~> 5.7.0"
  spec.add_development_dependency "mocha", "~> 1.1.0"
  spec.add_development_dependency "minitest-profile", "~> 0.0.2"
  spec.add_development_dependency "minitest-reporters", "~> 1.0.19"
  spec.add_development_dependency "guard", "~> 2.13.0"
  spec.add_development_dependency "guard-minitest", "~> 2.4.4"

  spec.add_development_dependency "vcr", "~> 2.9.3"
  spec.add_development_dependency "webmock", "~> 1.21.0"
  spec.add_development_dependency "multi_json", "~> 1.11.0"
  spec.add_development_dependency "simplecov", "~> 0.10.0"
  spec.add_development_dependency "rubocop", "~> 0.32.1"
  spec.add_development_dependency "coveralls", "~> 0.8.2"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4.7"

  spec.add_development_dependency "yard", "~> 0.8.7.6"
end
