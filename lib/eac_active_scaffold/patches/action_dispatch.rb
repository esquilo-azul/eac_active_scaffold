# frozen_string_literal: true

module EacActiveScaffold
  module Patches
    module ActionDispatch
      ACTIVE_SCAFFOLD_DEFAULT_CONCERN_NAME = :active_scaffold

      def active_scaffold
        active_scaffold_concern_set
        active_scaffold_concern_name
      end

      def active_scaffold_concern_set
        return if @concerns.key?(active_scaffold_concern_name)

        concern(active_scaffold_concern_name,
                ::ActiveScaffold::Routing::Basic.new(association: true))
      end

      def active_scaffold_concern_name
        ACTIVE_SCAFFOLD_DEFAULT_CONCERN_NAME
      end
    end
  end
end

require 'action_dispatch/routing/mapper'
::ActionDispatch::Routing::Mapper.include(
  ::EacActiveScaffold::Patches::ActionDispatch
)
