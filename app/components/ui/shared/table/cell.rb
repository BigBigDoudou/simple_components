# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Cell component
      class Cell < ApplicationComponent
        DEFAULT_CLASSES = "align-middle"

        def call
          tag.td(class: classes, colspan: options[:colspan]) do
            content
          end
        end
      end
    end
  end
end
