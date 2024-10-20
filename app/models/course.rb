# frozen_string_literal: true

class Course < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :contents, dependent: :destroy

  validates :title, :image, :description, :end_date, presence: true
  validates :title, uniqueness: true

  validate do
    errors.add(:end_date, "must be after the current date") if end_date.present? && end_date <= Date.current
  end
end
