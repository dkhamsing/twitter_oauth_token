# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_oauth_token/version'

Gem::Specification.new do |spec|
  spec.name          = TwitterOAuthToken::PROJECT
  spec.version       = TwitterOAuthToken::VERSION
  spec.authors       = ['dkhamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = 'Library to get the Twitter OAuth access token'
  spec.description   = 'Based on get-twitter-oauth-token'
  spec.homepage      = 'https://github.com/dkhamsing/twitter_oauth_token'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [spec.name]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'oauth', '~> 0.5.0'
end
