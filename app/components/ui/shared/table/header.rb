# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Header component
      class Header < ApplicationComponent
        DEFAULT_CLASSES = "align-middle"

        def call
          tag.th(class: classes) do
            if sorter
              tag.div(class: "d-flex") do
                concat(sorter)
                concat(tag.div(class: "px-2") { content })
              end
            else
              content
            end
          end
        end

        private

        def sorter
          render(Ui::Shared::Table::Sorter.new(options))
        end
      end
    end
  end
end
