# frozen_string_literal: true

module Backoffice
  class CoursesController < BackofficeController
    before_action :find_course, only: %i[show edit update destroy]

    # GET /backoffice/courses
    def index
      @courses = Course.order(created_at: :desc)
    end

    # GET /backoffice/courses/new
    def new
      @course = Course.new
      render :form
    end

    def show; end

    # GET /backoffice/courses/:id/edit
    def edit
      render :form
    end

    # POST /backoffice/courses
    def create
      @course = Course.new(course_params)

      if @course.save
        redirect_to backoffice_course_url(@course), notice: "Course created successfully."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /backoffice/courses/:id
    def update
      if @course.update(course_params)
        redirect_to backoffice_course_url(@course), notice: "Course updated successfully."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # DELETE /backoffice/courses/:id
    def destroy
      @course.destroy
      redirect_to backoffice_courses_url, notice: "Course deleted successfully."
    end

    private

    def find_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :image, :image_cache, :description, :end_date)
    end
  end
end
