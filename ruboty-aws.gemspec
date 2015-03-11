# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/aws/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-aws"
  spec.version       = Ruboty::Aws::VERSION
  spec.authors       = ["Yuichiro Mukai"]
  spec.email         = ["y.iky917@gmail.com"]
  spec.summary       = "aws"
  spec.description   = "aws"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ruboty"
  spec.add_runtime_dependency "aws-sdk"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
