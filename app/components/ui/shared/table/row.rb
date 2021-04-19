# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Footer component
      class Row < ApplicationComponent
        include ViewComponent::SlotableV2

        renders_many :cells, Ui::Shared::Table::Cell

        def call
          tag.tr(class: classes) do
            cells.each do |cell|
              concat(cell)
            end
          end
        end
      end
    end
  end
end
