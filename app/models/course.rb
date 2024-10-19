# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :contents, dependent: :destroy

  validates :title, :image, :description, :end_date, presence: true
  validates :title, uniqueness: true
end
