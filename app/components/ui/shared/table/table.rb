# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Table component
      class Table < ApplicationComponent
        include ViewComponent::SlotableV2

        DEFAULT_CLASSES = "table table-sm table-hover small"

        renders_one :head, ->(opts) { Ui::Shared::Table::Head.new(opts.merge(options)) }
        renders_one :body, Ui::Shared::Table::Body

        def call
          tag.div do
            concat(
              tag.table(class: classes) do
                if content
                  concat(content)
                else
                  concat(head)
                  concat(body)
                end
              end
            )
            concat(pagination)
          end
        end

        private

        def pagination
          return unless options[:paginate]

          render Ui::Shared::Table::Pagination.new(options)
        end
      end
    end
  end
end
