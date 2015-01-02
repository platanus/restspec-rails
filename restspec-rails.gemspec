# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'restspec/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "restspec-rails"
  spec.version       = Restspec::Rails::VERSION
  spec.authors       = ["juliogarciag"]
  spec.email         = ["julioggonz@gmail.com"]
  spec.summary       = %q{Integration between Restspec and Rails}
  spec.description   = %q{Integration between Restspec and Rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "restspec", Restspec::Rails::RESTSPEC_VERSION
  spec.add_dependency "rails", [">= 4"]

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry"
end
