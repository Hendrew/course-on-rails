# frozen_string_literal: true

require "rails_helper"

RSpec.describe Course, type: :model do
  let!(:course) { create(:course) }

  describe "associations" do
    it { is_expected.to have_many(:contents).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:end_date) }

    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
