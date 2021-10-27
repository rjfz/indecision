# frozen_string_literal: true

class LobbyContainer
  extend Dry::Container::Mixin

  register :create_lobby, Operations::Lobby::Create::EntryPoint
end

LobbyDependencies = Dry::AutoInject LobbyContainer
