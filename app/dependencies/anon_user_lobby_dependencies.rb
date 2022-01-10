# frozen_string_literal: true

class AnonUserLobbyContainer
  extend Dry::Container::Mixin

  register :create_anon_user_lobby, Operations::AnonUserLobby::Create::EntryPoint
end

AnonUserLobbyDependencies = Dry::AutoInject AnonUserLobbyContainer
