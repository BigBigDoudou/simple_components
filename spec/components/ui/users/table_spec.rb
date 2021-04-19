require "rails_helper"

RSpec.describe Ui::Users::Table, type: :component do
  it "renders component" do
    user = create(:user, first_name: "John", last_name: "Doe")
    user = user.decorate
    render_inline(described_class.new([user]))

    expect(rendered_component).to have_text "John"
    expect(rendered_component).to have_text "Doe"
  end
end
