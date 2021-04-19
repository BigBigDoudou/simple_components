# frozen_string_literal: true

module ComponentsHelper
  def projects_table(projects)
    render Ui::Projects::Table.new(projects, pages_count: projects.total_pages)
  end

  def users_table(users)
    render Ui::Users::Table.new(users, pages_count: users.total_pages)
  end
end
