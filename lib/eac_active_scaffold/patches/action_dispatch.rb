# frozen_string_literal: true

module EacActiveScaffold
  module Patches
    module ActionDispatch
      ACTIVE_SCAFFOLD_CONCERNS = {
        active_scaffold: -> {  ::ActiveScaffold::Routing::Basic.new(association: true) }
      }.freeze

      ACTIVE_SCAFFOLD_CONCERNS.each do |name, proc|
        define_method name do
          concern(name, proc.call) unless @concerns.key?(name)
          name
        end
      end
    end
  end
end

require 'action_dispatch/routing/mapper'
::ActionDispatch::Routing::Mapper.include(
  ::EacActiveScaffold::Patches::ActionDispatch
)
