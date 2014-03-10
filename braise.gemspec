# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'braise/version'

Gem::Specification.new do |spec|
  spec.name          = "braise"
  spec.version       = Braise::VERSION
  spec.authors       = ["Alex Lau"]
  spec.description   = "Syntatic sugar for the raise method"
  spec.summary       = "Shortcuts `raise obj.inspect` and makes it easy to add color terminal output"
  spec.homepage      = "https://github.com/MrAlexLau/braise"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "ansi"
end
