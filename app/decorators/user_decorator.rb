# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  alias user object

  delegate_all

  def name
    "#{user.first_name} #{user.last_name}"
  end

  def status_color
    user.is_active ? "success" : "danger"
  end

  def last_projects(count)
    user.projects.order(created_ad: :desc).decorate.first(count)
  end
end
