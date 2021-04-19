# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    user
    sequence(:title) { |n| "Project #{n}" }
    description { "Lorem ipsum" }

    trait :draft do
      status { "draft" }
    end

    trait :published do
      status { "published" }
    end
  end
end
