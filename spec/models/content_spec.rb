# frozen_string_literal: true

require "rails_helper"

RSpec.describe Content, type: :model do
  let!(:content) { create(:content) }

  describe "associations" do
    it { is_expected.to belong_to(:course) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:video) }

    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:course_id) }
  end
end
