require 'bundler/setup'
Bundler.setup

require 'stay_classy'

RSpec.configure do |config|
  config.fail_fast = true
  config.color = true
end