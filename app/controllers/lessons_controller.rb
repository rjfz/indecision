# frozen_string_literal: true

class LessonsController < AuthenticatedController
  include LessonDependencies['create_lesson']

  before_action :lesson, only: %i[show]

  def index
    @lessons = Presenter.from(Lesson.all) if Lesson.any?
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = create_lesson.call(lesson_params)
    redirect_to course_path(@lesson.course)
  end

  private

  def lesson
    @lesson ||= Lesson.find(params[:id])
  end

  def lesson_params
    symbolize params.require(:lesson).permit(
      :name,
      :number,
      :course_id
    )
  end
end
