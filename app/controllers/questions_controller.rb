# frozen_string_literal: true

class QuestionsController < AuthenticatedController
  include LessonDependencies['create_lesson']

  def index
    @questions = Presenter.from Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = create_question.call(question_params)
  end

  private

  def question_params
    symbolize params.require(:question).permit(
      :title,
      :time_limit
    )
  end
end
