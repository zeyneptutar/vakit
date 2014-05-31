# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vakit/version'

Gem::Specification.new do |spec|
  spec.name          = "vakit"
  spec.version       = Vakit::VERSION
  spec.authors       = ["Soner CAN"]
  spec.email         = ["soner2@gmail.com"]
  spec.description   = %q{A gem for easily getting salah times for Turkey}
  spec.summary       = %q{Salah times for Turkey}
  spec.homepage      = "http://github.com/scaryguy/vakit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "time_diff"
  
end
