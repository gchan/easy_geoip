require "support/simplecov_setup"
require "support/minitest_reporters_setup"
require "support/vcr_setup"

require "minitest/autorun"
require "mocha/mini_test"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "easy_geoip"
