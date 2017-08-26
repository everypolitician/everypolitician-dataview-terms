# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'everypolitician/dataview/terms/version'

Gem::Specification.new do |spec|
  spec.name          = 'everypolitician-dataview-terms'
  spec.version       = Everypolitician::Dataview::Terms::VERSION
  spec.authors       = ['Tony Bowden']
  spec.email         = ['tony@mysociety.org']

  spec.summary       = 'Generate Terms CSVs from EveryPolitician Popolo'
  spec.homepage      = 'https://github.com/everypolitician/everypolitician-dataview-terms'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_runtime_dependency 'everypolitician-popolo'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rubocop', '~> 0.42'
end
