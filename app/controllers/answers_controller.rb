# frozen_string_literal: true

class AnswersController < AuthenticatedController
  include AnswerDependencies['create_answer', 'update_answer']

  before_action :answer, only: %i[update show edit]

  def index
    @answers = Presenter.from Answer.all if Answer.any?
  end

  def new
    @answer = Answer.new
  end

  def create
    answer_params[:answers].each do |answer|
      create_answer.call(**symbolize(answer.merge(**base_params)))
      redirect_to new_answer_path
    end
  end

  def update
    @answer = update_answer.call(answer: answer, **base_params)
    redirect_to edit_question_path(@answer.question)
  end

  private

  def answer
    @answer ||= Answer.find(params[:id])
  end

  def answer_params
    symbolize params.require(:answer).permit(answers: %i[value correct])
  end

  def base_params
    symbolize params.require(:answer).permit(:question_id, :value, :correct)
  end
end
