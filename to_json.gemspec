# -*- encoding: utf-8 -*-
require File.expand_path('../lib/to_json/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Avrohom Katz"]
  gem.email         = ["akatz@engineyard.com"]
  gem.description   = %q{TODO: just reimplement to_json for fun}
  gem.summary       = %q{adds a to_json method to strings fixnums arrays and hashes}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "to_json"
  gem.require_paths = ["lib"]
  gem.version       = ToJson::VERSION

  gem.add_development_dependency("rspec")
end
