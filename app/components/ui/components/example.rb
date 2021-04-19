# frozen_string_literal: true

module Ui
  module Components
    class Example < ApplicationComponent
      include ViewComponent::Translatable

      def initialize(message)
        @message = message
      end

      def call
        tag.div(
          "#{t(".alert")}: #{@message}",
          class: "alert alert-primary alert-custom",
          role: "alert",
          data: { js: "example-component" }
        )
      end
    end
  end
end
