# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Head component
      class Head < ApplicationComponent
        include ViewComponent::SlotableV2

        renders_many :headers, ->(opts) { Ui::Shared::Table::Header.new(opts.merge(options)) }

        def call
          tag.thead do
            if content
              concat(content)
            else
              tag.tr do
                headers.each do |header|
                  concat(header)
                end
              end
            end
          end
        end
      end
    end
  end
end
