# frozen_string_literal: true

class ProjectsTablePreview < ViewComponent::Preview
  def with_projects
    projects = FactoryBot.create_list(:project, 1)
    projects = ProjectDecorator.decorate_collection(projects)
    render(Ui::Projects::Table.new(projects))
  end
end
