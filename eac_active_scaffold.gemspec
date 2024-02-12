# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'eac_active_scaffold/version'

Gem::Specification.new do |s|
  s.name        = 'eac_active_scaffold'
  s.version     = EacActiveScaffold::VERSION
  s.authors     = ['Put here the authors']
  s.summary     = 'Put here de description.'

  s.files = Dir['{app,lib}/**/*']
  s.required_ruby_version = '>= 2.7'

  s.add_dependency 'active_scaffold', '~> 3.7'
  s.add_dependency 'eac_ruby_utils', '~> 0.121'

  s.add_development_dependency 'eac_rails_gem_support', '~> 0.9.1'
end
