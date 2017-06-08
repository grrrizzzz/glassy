# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glassy/version'

Gem::Specification.new do |spec|
  spec.name          = 'glassy'
  spec.version       = Glassy::VERSION
  spec.authors       = ['Mike Grissom']
  spec.email         = ['lmgrissom@gmail.com']

  spec.summary       = %q{Know when to go!}
  spec.description   = %q{Get alerts when it's gonna be glassy!}
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'json'#, '~> 1.8.7'

  spec.add_development_dependency 'bundler'#, '~> 1.10.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'factory_girl', '~> 4.0'
  spec.add_development_dependency 'pry'
end
