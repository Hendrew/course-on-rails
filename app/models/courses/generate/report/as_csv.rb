# frozen_string_literal: true

module Courses
  module Generate
    module Report
      class AsCsv
        class << self
          def call
            courses = Course.order(title: :asc).includes(:contents)

            data = ::CSV.generate(headers: true) do |csv|
              csv << ["Title", "Description", "End Date", "Total size of videos"]

              courses.each do |course|
                csv << [course.title, course.description, course.end_date.to_s, total_size_of_videos(course)]
              end
            end

            { data:, filename: "course_report_#{DateTime.current.to_i}.csv",
              type: "text/csv; charset=utf-8; header=present" }
          end

          private

          def total_size_of_videos(course)
            total_size = course.contents.map(&:video_size).sum

            Utils::SizeInHumanFormat.call(total_size)
          end
        end
      end
    end
  end
end
