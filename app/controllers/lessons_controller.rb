# frozen_string_literal: true

class LessonsController < AuthenticatedController
  include LessonDependencies['create_lesson']

  def index
    @lessons = Presenter.from Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = create_lesson.call(lesson_params)
  end

  private

  def lesson_params
    symbolize params.require(:lesson).permit(
      :name,
      :number,
      :course_id
    )
  end
end
