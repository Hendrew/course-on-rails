# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name      { Faker::Name.name }
    email     { Faker::Internet.email }
    password  { "123456" }
    active    { true }
  end
end
