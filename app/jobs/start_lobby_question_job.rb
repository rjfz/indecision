# frozen_string_literal: true

class StartLobbyQuestionJob < ApplicationJob
  queue_as :default

  def perform(lobby_question)
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'started',
                                                       started_at: Time.now)
    timer = lobby_question.started_at + lobby_question.question.time_limit.seconds
    FinishLobbyQuestionJob.set(wait_until: timer).perform_later(lobby_question)
    response = Response.new(lobby_question_id: lobby_question.id)
    response.broadcast_replace_to(lobby_question.lobby_id) do
      render response
    end
  end
end
