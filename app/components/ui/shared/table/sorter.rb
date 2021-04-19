# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Sorter component
      class Sorter < ApplicationComponent
        def call
          return unless options[:path] && options[:sort_by]

          link_to(path) do
            tag.i(class: icon)
          end
        end

        private

        def active?
          params[:sort_by] == options[:sort_by]
        end

        def order
          active? && params[:sort_order] == "asc" ? :desc : :asc
        end

        def icon
          return "fas fa-sort" unless active?

          "fas fa-sort-#{{ asc: "down", desc: "up" }[order]}"
        end

        def path
          options[:path].call(page: 1, sort_by: options[:sort_by], sort_order: order)
        end
      end
    end
  end
end
