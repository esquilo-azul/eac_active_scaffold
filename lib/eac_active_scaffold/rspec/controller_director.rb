# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacActiveScaffold
  module Rspec
    class ControllerDirector
      enable_listable
      lists.add_symbol :option, :index_path, :model_class, :valid_data
      common_constructor :example, :options do
        self.options = self.class.lists.option.hash_keys_validate!(options)
      end

      # @return [String]
      def attribute_label(attr)
        model_class.human_attribute_name(attr)
      end

      # @return [String]
      def index_path
        options.fetch(OPTION_INDEX_PATH)
      end

      # @return [Class]
      def model_class
        options.fetch(OPTION_MODEL_CLASS)
      end

      # @return [String]
      def page_title
        model_class.model_name.human(count: 2)
      end

      # @return [Hash]
      def valid_data
        options.fetch(OPTION_VALID_DATA)
      end
    end
  end
end
