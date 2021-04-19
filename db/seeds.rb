# frozen_string_literal: true

require "faker"

User.insert_all(
  Array.new(100) do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    date = Faker::Date.between(from: "2014-01-01", to: "2020-12-31")
    {
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name.underscore}.#{last_name.underscore}@example.com",
      is_active: rand(8) < 6,
      score: rand(100),
      created_at: date,
      updated_at: date
    }
  end
)

Project.insert_all(
  Array.new(100) do
    date = Faker::Date.between(from: "2014-01-01", to: "2020-12-31")
    {
      user_id: User.ids.sample,
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph,
      status: %w[draft published].sample,
      created_at: date,
      updated_at: date
    }
  end
)
