# frozen_string_literal: true

RSpec.configure do |config|
  config.after do
    if Rails.env.test?
      FileUtils.rm_rf(Rails.root.join("public/uploads/test"))
      FileUtils.rm_rf(Rails.root.join("public/uploads/tmp"))
    end
  end
end
