# frozen_string_literal: true

class LobbyQuestionContainer
  extend Dry::Container::Mixin

  register :update_lobby_question, Operations::LobbyQuestion::Update::EntryPoint
end

LobbyQuestionDependencies = Dry::AutoInject LobbyQuestionContainer
