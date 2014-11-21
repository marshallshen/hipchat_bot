# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "hipchat_bot"
  spec.version       = "0.0.2"
  spec.authors       = ["Marshall Shen"]
  spec.email         = ["shen.marshall@gmail.com"]
  spec.summary       = "Hipchat client"
  spec.description   = "Hipchat client"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = []

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.20.4"
end
