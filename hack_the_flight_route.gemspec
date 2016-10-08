# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hack_the_flight_route/version'

Gem::Specification.new do |gem|
  gem.name          = "hack_the_flight_route"
  gem.version       = HackTheFlightRouteVersion::VERSION
  gem.authors       = ["Pulak Ghosh"]
  gem.email         = ["ghosh.pulak91@gmail.com"]
  gem.description   = %q{This is simple ruby code to find minimum distance need to fly from one city to another using Dijkstra.}
  gem.summary       = %q{Hack The Flight Route}
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|specs|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "minitest"
end
