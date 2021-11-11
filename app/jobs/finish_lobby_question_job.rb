class FinishLobbyQuestionJob < ApplicationJob

  queue_as :default

  def perform(lobby_question)
    Operations::LobbyQuestion::Update::EntryPoint.call(lobby_question: lobby_question, state: 'finished')
  end

end
