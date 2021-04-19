# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    transient do
      name { Faker::Name.unique.name }
    end
    first_name { name.split.first }
    last_name { name.split.last }
    email { "#{first_name.underscore}.#{last_name.underscore}@example.com" }

    trait :active do
      is_active { true }
    end

    trait :inactive do
      is_active { false }
    end
  end
end
