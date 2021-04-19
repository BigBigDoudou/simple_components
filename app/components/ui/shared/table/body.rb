# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Body component
      class Body < ApplicationComponent
        include ViewComponent::SlotableV2

        renders_many :rows, Ui::Shared::Table::Row
        renders_one :footer, Ui::Shared::Table::Footer

        def call
          tag.tbody do
            if content
              concat(content)
            else
              rows.each do |row|
                concat(row)
              end
              concat(footer)
            end
          end
        end
      end
    end
  end
end
