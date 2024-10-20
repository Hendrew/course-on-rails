# frozen_string_literal: true

class Content < ApplicationRecord
  mount_uploader :video, VideoUploader

  belongs_to :course

  validates :title, :video, presence: true
  validates :title, uniqueness: { scope: :course_id }

  before_save do
    self.video_size = video.size
  end
end
