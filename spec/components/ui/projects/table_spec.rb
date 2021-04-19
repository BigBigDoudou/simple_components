require "rails_helper"

RSpec.describe Ui::Projects::Table, type: :component do
  it "renders component" do
    user = create(:user, last_name: "Doe")
    project = create(:project, :draft, title: "Foo", user: user)
    project = project.decorate
    render_inline(described_class.new([project]))

    expect(rendered_component).to have_text "Foo"
    expect(rendered_component).to have_text "Doe"
    expect(rendered_component).to have_text "draft"
  end
end
