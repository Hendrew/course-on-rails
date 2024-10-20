# frozen_string_literal: true

module Front
  class CoursesController < FrontController
    before_action :load_course, :check_end_date, only: %i[show]
    def index
      @courses = Course.where("end_date > ?", Date.current.beginning_of_day).order(created_at: :desc)
    end

    def show
      @content = @course.contents.find_by(id: params[:content_id])
    end

    private

    def load_course
      @course = Course.find_by(id: params[:id])
    end

    def check_end_date
      redirect_to(root_path, alert: "Course not found") if @course.end_date.end_of_day < Date.current.beginning_of_day
    end
  end
end
