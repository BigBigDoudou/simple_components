# frozen_string_literal: true

module Ui
  module Shared
    module Table
      # Pagination component
      class Pagination < ApplicationComponent
        include ViewComponent::Translatable

        DEFAULT_CLASSES = "pagination"

        def call
          tag.nav do
            tag.ul(class: "pagination justify-content-center") do
              concat(tag.li(class: "page-item #{"disabled" if first_page?}") do
                link_to(t(".previous"), path_to(current_page - 1), class: "page-link")
              end)
              (1..options[:last_page]).each do |page|
                active = page == current_page
                concat(tag.li(class: "page-item #{"active" if active}") do
                  link_to_if(!active, page, path_to(page), class: "page-link") do
                    tag.span(page, class: "page-link")
                  end
                end)
              end
              concat(tag.li(class: "page-item #{"disabled" if last_page?}") do
                link_to(t(".next"), path_to(current_page + 1), class: "page-link")
              end)
            end
          end
        end

        private

        def current_page
          params[:page]&.to_i || 1
        end

        def first_page?
          current_page == 1
        end

        def last_page?
          current_page == options[:last_page]
        end

        def path_to(page)
          options[:path].call(
            page: page,
            sort_by: params[:sort_by],
            sort_order: params[:sort_order]
          )
        end
      end
    end
  end
end
