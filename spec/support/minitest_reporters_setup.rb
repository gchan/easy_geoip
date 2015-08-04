require "minitest/reporters"

# Redgreen-capable version of standard Minitest reporter
# Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

# Turn-like output that reads like a spec
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Fuubar-like output with a progress bar
# Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
