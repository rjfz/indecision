# frozen_string_literal: true

class QuestionsController < AuthenticatedController
  include QuestionDependencies['create_question', 'update_question']

  before_action :question, only: %i[update show edit]

  def index
    @questions = Presenter.from Question.all if Question.any?
  end

  def new
    @question = Question.new
  end

  def create
    @question = create_question.call(question_params)
    redirect_to new_answer_path
  end

  def update
    @question = update_question.call(question: question, **question_params)
    redirect_to edit_lesson_path(@question.lesson)
  end

  private

  def question
    @question ||= Question.find(params[:id])
  end

  def question_params
    symbolize params.require(:question).permit(
      :title,
      :time_limit,
      :lesson_id
    )
  end
end
