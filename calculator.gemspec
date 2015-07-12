# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "calculator"
  spec.version       = '0.01'
  spec.authors       = ["CalcTeam"]
  spec.summary       = %q{The best RPN calculator yet}
  spec.homepage      = "https://github.com/bcamarda/calculator"
  spec.license       = "Apache License, v2.0"

  spec.files         = ['lib/calculator.rb']
  spec.executables   = ['bin/calculator']
  spec.test_files    = ['tests/test_calculator.rb']
  spec.require_paths = ["lib"]
end
