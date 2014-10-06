# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stay_classy/version'

Gem::Specification.new do |spec|
  spec.name          = "stay_classy"
  spec.version       = '0.1.2'
  spec.authors       = ["Nick Mueller"]
  spec.email         = ["nickmueller@live.com"]
  spec.summary       = %q{Add classes and ids to your rails app}
  spec.description   = %q{This gem adds classes and ids to the view files and partials in your rails application}
  spec.homepage      = "https://github.com/nickmlr/stay_classy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.bindir        = 'bin'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "bin"]

  spec.add_dependency 'colorize'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
