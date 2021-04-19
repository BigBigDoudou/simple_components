# frozen_string_literal: true

class ProjectDecorator < Draper::Decorator
  alias project object

  delegate_all
  decorates_association :user

  def user_name
    if project.user
      user.name
    else
      ""
    end
  end

  def status_color
    {
      draft: "secondary",
      published: "success"
    }[project.status.to_sym]
  end
end
