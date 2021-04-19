# frozen_string_literal: true

module Ui
  module Users
    # Users Table component
    class Table < ApplicationComponent
      attr_reader :users

      def initialize(users, pages_count: nil) # rubocop:disable Lint/MissingSuper
        @users = users
        @pages_count = pages_count
      end

      def call
        render Ui::Shared::Table::Table.new(
          path: path,
          paginate: true,
          pages_count: @pages_count
        ) do |t|
          t.head do |h|
            h.header { tag.i(class: "fas fa-star") }
            h.header(sort_by: "first_name") { "First name" }
            h.header(sort_by: "last_name") { "Last name" }
            h.header(sort_by: "first_name") { "Name" }
            h.header(sort_by: "email") do
              tag.div(class: "d-flex flex-fill justify-content-center") do
                concat(tag.i(class: "fas fa-envelope-open-text mt-1"))
                concat(tag.span(class: "px-2 text-center") { "Email" })
              end
            end
            h.header(sort_by: "score") { "Score" }
            h.header { "Last projects" }
          end
          t.body do |b|
            users.each do |user|
              b.row(class: row_class(user)) do |r|
                r.cell do
                  tag.i(class: "fas fa-star text-#{star_color(user)}")
                end
                r.cell { user.first_name }
                r.cell { user.last_name }
                r.cell { user.name }
                r.cell { user.email }
                r.cell { user.score.to_s }
                r.cell do
                  tag.ul(class: "m-2 list-group list-group-flush small") do
                    user.last_projects(3).each do |project|
                      tag.li(class: "list-group-item bg-transparent d-flex justify-content-between align-items-center") do
                        concat(project.title)
                        concat(tag.span(class: "ml-1 badge bg-#{project.status_color}") { project.status })
                      end
                    end
                  end
                end
              end
            end
            b.footer do |f|
              f.cell(colspan: 5) { "Total" }
              f.cell { total_score }
              f.cell
            end
          end
        end
      end

      private

      def path
        proc do |page: 1, sort_by: nil, sort_order: nil|
          users_path(page: page, sort_by: sort_by, sort_order: sort_order)
        end
      end

      def star_color(user)
        user.is_active ? "success" : "danger"
      end

      def row_class(user)
        "table-danger" unless user.is_active
      end

      def total_score
        @users.map(&:score).compact.sum
      end
    end
  end
end
