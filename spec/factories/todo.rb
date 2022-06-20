# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    association :user

    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    due_date { Faker::Date.forward(days: 14) }
    complete { false }
  end
end
