# frozen_string_literal: true

class UsersTablePreview < ViewComponent::Preview
  def with_users
    users = FactoryBot.build_list(:user, 1)
    users = UserDecorator.decorate_collection(users)
    render(Ui::Users::Table.new(users))
  end
end
