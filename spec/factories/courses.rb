# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    title       { Faker::Lorem.sentence }
    image       { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/course-cover.png"), "image/png") }
    description { Faker::Lorem.paragraph }
    end_date    { Date.current + 15.days }
  end
end
