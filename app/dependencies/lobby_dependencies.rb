# frozen_string_literal: true

class LobbyContainer
  extend Dry::Container::Mixin

  register :create_lobby, Operations::Lobby::Create::EntryPoint
  register :update_lobby, Operations::Lobby::Update::EntryPoint
  register :create_lobby_question, Operations::LobbyQuestion::Create::EntryPoint
end

LobbyDependencies = Dry::AutoInject LobbyContainer
