# frozen_string_literal: true

class LobbyQuestionsController < AuthenticatedController
  include LobbyQuestionDependencies['update_lobby_question']

  before_action :lobby_question, only: %i[update]

  def update
    @lobby_question = update_lobby_question.call(lobby_question: lobby_question, **lobby_question_params)
  end

  private

  def lobby_question
    @lobby_question ||= LobbyQuestion.find(params[:id])
  end

  def lobby_question_params
    symbolize params.require(:lobby_question).permit(
      :state
    )
  end
end
