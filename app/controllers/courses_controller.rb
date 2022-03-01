# frozen_string_literal: true

class CoursesController < AuthenticatedController
  include CourseDependencies['create_course']

  before_action :course, only: %i[show stats]

  def index; end

  def new
    @course = Course.new
  end

  def create
    @course = create_course.call(course_params)
    redirect_to courses_path
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def course_params
    symbolize params.require(:course).permit(
      :name,
      :module_code,
      :subject_id
    )
  end
end
