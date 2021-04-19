# frozen_string_literal: true

module Ui
  module Projects
    # Projects Table component
    class Table < ApplicationComponent
      attr_reader :projects

      def initialize(projects, pages_count: nil) # rubocop:disable Lint/MissingSuper
        @projects = projects
        @pages_count = pages_count
      end

      def call
        render Ui::Shared::Table::Table.new(
          path: path,
          paginate: true,
          pages_count: @pages_count
        ) do |t|
          t.head do |h|
            h.header(sort_by: "title") { "Title" }
            h.header(sort_by: "description") { "Description" }
            h.header(sort_by: "status") { "Status" }
            h.header { "User" }
          end
          t.body do |b|
            projects.each do |project|
              b.row(class: row_class(project)) do |r|
                r.cell { project.title }
                r.cell { project.description }
                r.cell { project.status }
                r.cell { project.user_name }
              end
            end
          end
        end
      end

      private

      def path
        proc do |page: 1, sort_by: nil, sort_order: nil|
          projects_path(page: page, sort_by: sort_by, sort_order: sort_order)
        end
      end

      def row_class(project)
        "table-secondary" if project.status == "draft"
      end
    end
  end
end
