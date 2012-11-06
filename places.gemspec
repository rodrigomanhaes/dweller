# encoding: utf-8

$:.push File.expand_path("../lib", __FILE__)

require 'version'

Gem::Specification.new do |s|
  s.name = 'places'
  s.version = Places::VERSION
  s.date = %q{2012-11-06}
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.author = 'Rodrigo Manhães'
  s.description = 'Information about places: countries, states, cities etc.'
  s.email = 'rmanhaes@gmail.com'
  s.homepage = 'https://github.com/rodrigomanhaes/places'
  s.summary = 'Information about places: countries, states, cities etc.'

  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']

  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('data/*.yml') + %w(README.rdoc LICENSE.txt)
  s.add_development_dependency('spreadsheet')
  s.add_development_dependency('rspec', '~> 2.11')
  s.add_development_dependency('bundler')
end
