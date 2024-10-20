# frozen_string_literal: true

module Backoffice
  class ContentsController < BackofficeController
    before_action :load_course, only: %i[new create edit update destroy]
    before_action :find_content, only: %i[edit update destroy]

    # GET /backoffice/courses/:id/contents/new
    def new
      @content = @course.contents.build
      render :form
    end

    # GET /backoffice/courses/:id/contents/:id/edit
    def edit
      render :form
    end

    # POST /backoffice/courses/:id/contents
    def create
      @content = @course.contents.build(content_params)

      if @content.save
        redirect_to backoffice_course_url(@course, content_id: @content.id), notice: "Content created successfully."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /backoffice/courses/:id/contents/:id
    def update
      if @content.update(content_params)
        redirect_to backoffice_course_url(@course, content_id: @content.id), notice: "Content updated successfully."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # DELETE /backoffice/courses/:id/contents/:id
    def destroy
      @content.destroy
      redirect_to backoffice_course_url(@course), notice: "Content deleted successfully."
    end

    private

    def load_course
      @course = Course.find(params[:course_id])
    end

    def find_content
      @content = @course.contents.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :video, :video_cache)
    end
  end
end
