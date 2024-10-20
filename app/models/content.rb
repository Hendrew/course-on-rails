# frozen_string_literal: true

class Content < ApplicationRecord
  mount_uploader :video, VideoUploader

  belongs_to :course

  validates :title, :video, presence: true
  validates :title, uniqueness: { scope: :course_id }

  before_save do
    self.video_size = video.size
  end

  def next_content(course)
    course.contents.where("created_at > ?", created_at).order(created_at: :asc).first
  end

  def previous_content(course)
    course.contents.where("created_at < ?", created_at).order(created_at: :desc).first
  end
end
