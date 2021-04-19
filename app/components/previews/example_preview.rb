# frozen_string_literal: true

class ExamplePreview < ViewComponent::Preview
  def with_message
    render(Ui::Components::Example.new("Lorem Ipsum"))
  end
end
