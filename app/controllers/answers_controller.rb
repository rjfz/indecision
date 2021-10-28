# frozen_string_literal: true

class AnswersController < AuthenticatedController
  include LessonDependencies['create_lesson']

  def index
    @answers = Presenter.from Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = create_answer.call(answer_params)
  end

  private

  def answer_params
    symbolize params.require(:answer).permit(
      :title,
      :time_limit
    )
  end
end
