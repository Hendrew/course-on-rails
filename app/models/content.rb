# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :course

  validates :title, :video, presence: true
  validates :title, uniqueness: { scope: :course_id }
end
