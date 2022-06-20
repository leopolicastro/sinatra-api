# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    admin { false }
    password { encrypt_password("abc123") }
  end
  factory :admin, class: "User" do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    admin { true }
    password { encrypt_password("abc123") }
  end
end
