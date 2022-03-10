# frozen_string_literal: true

class ResponsesController < AuthenticatedController
  include ResponseDependencies['create_response']

  before_action :set_response, only: %i[show]

  def new
    @response = Response.new(lobby_question_id: params[:lobby_question_id])
  end

  def create
    if Response.where(anon_user_id: anon_user.id, lobby_question_id: response_params[:lobby_question_id]).none?
    @response = create_response.call(**response_params, anon_user_id: anon_user.id)
    end
    if lobby_question.question.question_type == 'Quickfire'
      if lobby_question.responses.correct.any?
        FinishLobbyQuestionJob.perform_later(lobby_question)
      end
    else
      timer = @response.lobby_question.started_at + @response.lobby_question.question.time_limit.seconds
      return timer_expired if Time.now > timer
    end
  end

  def timer_expired
    render 'times_up'
  end

  private

  def set_response
    @response ||= Response.find(params[:id]) # rubocop:disable Naming/MemoizedInstanceVariableName
  end

  def response_params
    symbolize params.require(:response).permit(
      :lobby_question_id,
      :answer_id,
      :user_id,
      :answer_text
    )
  end

  def lobby_question
    LobbyQuestion.find response_params[:lobby_question_id]
  end
end
