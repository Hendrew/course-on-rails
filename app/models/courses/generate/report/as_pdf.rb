# frozen_string_literal: true

module Courses
  module Generate
    module Report
      class AsPdf
        class << self
          def call
            courses = Course.order(title: :asc).includes(:contents)

            pdf = Prawn::Document.new(page_layout: :landscape)
            pdf = create_title(pdf)

            table_data = headers
            table_data = add_data_to_table(table_data, courses)

            pdf = add_table_in_pdf(table_data, pdf)

            { data: pdf.render, filename: "course_report_#{DateTime.current.to_i}.pdf", type: "application/pdf" }
          end

          private

          def create_title(pdf)
            pdf.text "Course report", size: 30, style: :bold, align: :center
            pdf.move_down 15
            pdf.stroke_horizontal_rule

            pdf
          end

          def headers
            [["Title", "Description", "End Date", "Total size of videos"]]
          end

          def add_data_to_table(table, courses)
            courses.each do |course|
              table << [course.title, course.description, course.end_date.to_s, total_size_of_videos(course)]
            end

            table
          end

          def total_size_of_videos(course)
            total_size = course.contents.map(&:video_size).sum

            Utils::SizeInHumanFormat.call(total_size)
          end

          def add_table_in_pdf(table, pdf)
            pdf.table(table, header: true, width: pdf.bounds.width) do
              row(0).font_style   = :bold
              columns(1..4).align = :left
            end

            pdf
          end
        end
      end
    end
  end
end
