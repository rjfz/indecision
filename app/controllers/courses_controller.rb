# frozen_string_literal: true

class CoursesController < AuthenticatedController
  include CourseDependencies['create_course']

  def index; end

  def new
    @course = Course.new
  end

  def create
    @course = create_course.call(course_params)
  end

  private

  def course_params
    symbolize params.require(:course).permit(
      :name,
      :module_code,
      :subject_id
    )
  end
end
