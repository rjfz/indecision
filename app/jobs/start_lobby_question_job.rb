# frozen_string_literal: true

class StartLobbyQuestionJob < ApplicationJob
  include ActionView::RecordIdentifier
  queue_as :default

  def perform(lobby_question)
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'started',
                                                       started_at: Time.now)

    lobby_id = lobby_question.lobby_id
    lobby_question.lobby.lobby_questions.each{ _1.broadcast_replace_to "lobby_#{lobby_id}_questions" }
    
    timer = lobby_question.started_at + lobby_question.question.time_limit.seconds
    if lobby_question.question.question_type != 'Quickfire'
      FinishLobbyQuestionJob.set(wait_until: timer).perform_later(lobby_question)
    end

    response = Response.new(lobby_question_id: lobby_question.id)
    response.broadcast_replace_to(
      dom_id(lobby_question.lobby),
      target: 'response'
    )
  end
end
