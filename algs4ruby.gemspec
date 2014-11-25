# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'algs4ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "algs4ruby"
  spec.version       = Algs4ruby::VERSION
  spec.authors       = ["wendi"]
  spec.email         = ["ifyouseewendy@gmail.com"]
  spec.summary       = %q{Algorithms implemented by Ruby}
  spec.description   = <<-HERE
+ Graph
  - (Di)graph
  - DFS, BFS
  - Topological Sort
  - (Strong) Connected Component
  HERE
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-byebug"
end
