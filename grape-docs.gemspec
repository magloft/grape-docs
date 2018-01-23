lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape_docs/version'

Gem::Specification.new do |s|
  s.name        = "grape-docs"
  s.version     = GrapeDocs::VERSION
  s.licenses    = ["BSD-3-Clause"]
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tobias Strebitzer"]
  s.email       = ["tobias.strebitzer@magloft.com"]
  s.homepage    = "https://github.com/magloft/grape-docs"
  s.summary     = "Automatically generate documentation from grape API"
  s.description = "grape-docs automagically generates documentation for your Grape API in various formats."
  s.required_ruby_version = '~> 2.0'
  s.required_rubygems_version = '~> 2.4'
  s.add_dependency "bundler", '>= 1.3.0', '< 2.0'
  s.add_dependency "thor", '~> 0.2'
  s.add_dependency "workspace", '~> 1.0'
  s.add_dependency "activesupport", '>= 4.0', '< 6.0'
  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "rubocop", "~> 0.49"
  s.executables << 'grape-docs'
  s.files        = Dir["README.md", "lib/**/*"]
  s.require_path = 'lib'
end
