class StartLobbyQuestionJob < ApplicationJob

  queue_as :default

  def perform(lobby_question)
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'started')
  end

end
