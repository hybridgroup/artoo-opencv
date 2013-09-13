# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-opencv/version"

Gem::Specification.new do |s|
  s.name        = "artoo-opencv"
  s.version     = Artoo::Opencv::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adrian Zankich"]
  s.email       = ["artoo@hybridgroup.com"]
  s.homepage    = "http://artoo.io"
  s.summary     = %q{Artoo adaptor and driver for Opencv}
  s.description = %q{Artoo adaptor and driver for Opencv}

  s.rubyforge_project = "artoo-opencv"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '~> 1.1.0'
  s.add_runtime_dependency "ruby-opencv", "~> 0.0.10"
  # s.add_development_dependency 'minitest', '~> 5.0'
  # s.add_development_dependency 'minitest-happy'
  # s.add_development_dependency 'mocha', '~> 0.14.0'
end
