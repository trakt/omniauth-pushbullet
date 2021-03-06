# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-pushbullet/version'

Gem::Specification.new do |spec|
  spec.name                  = "omniauth-pushbullet"
  spec.version               = Omniauth::Pushbullet::VERSION
  spec.authors               = ["Brandon Rice"]
  spec.email                 = ["brandon@blrice.net"]
  spec.license               = 'MIT'

  spec.summary               = %q{Pushbullet OAuth2 strategy for OmniAuth}
  spec.description           = %q{Pushbullet OAuth2 strategy for OmniAuth}
  spec.homepage              = "https://github.com/nevern02/omniauth-pushbullet"
  spec.required_ruby_version = ">= 1.9.3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", ">= 1.5"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "webmock", "~> 1.24"
end
