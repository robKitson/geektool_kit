# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geektool_kit/version'

Gem::Specification.new do |spec|
  spec.name          = "geektool_kit"
  spec.version       = GeektoolKit::VERSION
  spec.authors       = ["Rob Kitson"]
  spec.email         = ["robk@robkitson.net"]
  spec.summary       = %q{A rubygem for generating and running geeklets.}
  spec.description   = %q{A rubygem for generating and running geeklets.}
  spec.homepage      = "https://github.com/robKitson/geektool_kit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-mocks"

  spec.add_runtime_dependency "thor", ["= 0.19.1"]
end
