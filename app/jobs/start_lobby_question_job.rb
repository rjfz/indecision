class StartLobbyQuestionJob < ApplicationJob

  queue_as :default

  def perform(lobby_question)
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'started')
    response = Response.new(lobby_question_id: lobby_question.id)
    response.broadcast_replace_to(lobby_question.lobby_id) do
      render response
    end
  end

end
