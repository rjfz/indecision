# frozen_string_literal: true

class AnswersController < AuthenticatedController
  include AnswerDependencies['create_answer', 'update_answer', 'destroy_answer']

  before_action :answer, only: %i[update show edit]

  def index
    @answers = Presenter.from Answer.all if Answer.any?
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = create_answer.call(**base_params)
    redirect_to edit_question_path(@answer.question)
  end

  def update
    @answer = update_answer.call(answer: answer, **base_params)
    redirect_to edit_question_path(@answer.question)
  end

  def destroy
    @answer = destroy_answer.call(answer_id: answer.id)
    redirect_to edit_question_path(@answer.question)
  end


  private

  def answer
    @answer ||= Answer.find(params[:id])
  end

  def base_params
    symbolize params.require(:answer).permit(:question_id, :value, :correct)
  end
end
