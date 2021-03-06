require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock

  config.default_cassette_options = { serialize_with: :json }

  config.ignore_hosts "codeclimate.com"
end

require "helpers/request_helpers"
