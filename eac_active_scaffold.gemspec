# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'eac_active_scaffold/version'

Gem::Specification.new do |s|
  s.name        = 'eac_active_scaffold'
  s.version     = EacActiveScaffold::VERSION
  s.authors     = ['Put here the authors']
  s.summary     = 'Put here de description.'

  s.files = Dir['{app,lib}/**/*']

  s.add_dependency 'active_scaffold', '~> 3.5.5'
  s.add_dependency 'eac_ruby_utils', '~> 0.74'

  s.add_development_dependency 'eac_ruby_gem_support', '~> 0.4'
end
