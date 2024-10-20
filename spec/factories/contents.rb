# frozen_string_literal: true

FactoryBot.define do
  factory :content do
    title       { Faker::Lorem.sentence }
    video       { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/video.mp4"), "video/mp4") }
    video_size  { nil }
    course      { create(:course) }
  end
end
