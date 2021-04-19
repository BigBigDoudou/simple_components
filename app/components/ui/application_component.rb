# frozen_string_literal: true

module Ui
  # Application component
  class ApplicationComponent < ViewComponent::Base
    DEFAULT_CLASSES = ""

    attr_reader :options

    def initialize(options = {}) # rubocop:disable Style/OptionHash, Lint/MissingSuper
      @options = options
    end

    private

    def classes
      options[:class] || self.class::DEFAULT_CLASSES
    end
  end
end
