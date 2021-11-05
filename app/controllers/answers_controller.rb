# frozen_string_literal: true

class AnswersController < AuthenticatedController
  include AnswerDependencies['create_answer']

  def index
    @answers = Presenter.from Answer.all if Answer.any?
  end

  def new
    @answer = Answer.new
  end

  def create
    answer_params[:answers].each do |answer|
      create_answer.call(**symbolize(answer.merge(**base_params)))
    end
  end

  private

  def answer_params
    symbolize params.require(:answer).permit(answers: %i[value correct])
  end

  def base_params
    symbolize params.require(:answer).permit(:question_id)
  end

end
