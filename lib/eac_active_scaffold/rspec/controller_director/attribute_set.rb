# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacActiveScaffold
  module Rspec
    class ControllerDirector
      class AttributeSet
        enable_method_class
        common_constructor :director, :example, :name, :value

        def result
          text_fill
        end

        private

        def label
          director.attribute_label(name)
        end

        def text_fill
          example.fill_in label, with: value
        end
      end
    end
  end
end
