require "simplecov"
require "coveralls"
require "codeclimate-test-reporter"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter,
  CodeClimate::TestReporter::Formatter
]

# No JRuby support for SimpleCov
# https://github.com/metricfu/metric_fu/commit/2248706
unless defined?(JRUBY_VERSION)
  SimpleCov.start do
    add_filter "/spec/"
  end
end
