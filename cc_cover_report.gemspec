# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cc_cover_report/version'

Gem::Specification.new do |spec|
  spec.name          = "cc_cover_report"
  spec.version       = CcCoverReport::VERSION
  spec.authors       = ["Encore"]
  spec.email         = ["hello@encore.io"]
  spec.summary       = %q{Capture SimpleCov coverage reports.}
  spec.description   = %q{Capture SimpleCov coverage reports and report these to CC servers for a given commit. Assumes git and SimpleCov are already in use.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "simplecov"
end
