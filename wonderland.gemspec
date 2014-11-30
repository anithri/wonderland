# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wonderland/version'

Gem::Specification.new do |spec|
  spec.name          = "wonderland"
  spec.version       = File.read('VERSION')
  spec.authors       = ["Scott M Parrish"]
  spec.email         = ["anithri@gmail.com"]
  spec.summary       = %q{Board Game Component - game maps and boards}
  spec.description   = %q{library to define board game maps with}
  spec.homepage      = "https://github.com/anithri/wonderland"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
