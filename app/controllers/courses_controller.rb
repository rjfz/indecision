# frozen_string_literal: true

class CoursesController < AuthenticatedController
  include CourseDependencies['create_course', 'update_course']

  before_action :course, only: %i[edit show stats]

  def index; end

  def new
    @course = Course.new(**preload_params)
  end

  def create
    @course = create_course.call(create_course_params)
    redirect_to courses_path
  end

  def update
    @course = update_course.call(course: course, **update_course_params)
    redirect_to @course
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def create_course_params
    symbolize params.require(:course).permit(:name, :module_code, :subject_id, :image)
  end

  def update_course_params
    symbolize params.require(:course).permit(:name, :module_code, :image)
  end

  def preload_params
    symbolize params.permit(:subject_id)
  end
end
