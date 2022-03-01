# frozen_string_literal: true

class LessonsController < AuthenticatedController
  include LessonDependencies['create_lesson', 'update_lesson']

  before_action :lesson, only: %i[show edit stats]

  def index
    @lessons = Presenter.from(Lesson.all) if Lesson.any?
  end

  def new
    @lesson = Lesson.new(**preload_params)
  end

  def create
    @lesson = create_lesson.call(create_lesson_params)
    redirect_to course_path(@lesson.course)
  end

  def update
    @lesson = update_lesson.call(lesson: lesson, **update_lesson_params)
    redirect_to @lesson
  end

  private

  def lesson
    @lesson ||= Lesson.find(params[:id])
  end

  def create_lesson_params
    symbolize params.require(:lesson).permit(:name, :number, :course_id, :image)
  end

  def update_lesson_params
    symbolize params.require(:lesson).permit(:name, :number, :image)
  end

  def preload_params
    symbolize params.permit(:course_id)
  end
end
