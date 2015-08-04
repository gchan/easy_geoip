guard :minitest do
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/.*/(.+)\.rb$})          { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/minitest_helper\.rb$}) { "spec" }
end
