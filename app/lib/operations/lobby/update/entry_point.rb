# frozen_string_literal: true

module Operations
  module Lobby
    module Update
      class EntryPoint
        include ::EntryPoint

       def initialize(lobby:, **params)
          @form = Forms::Lobby.new(**params).with(lobby)
          @action = Action.new(lobby, form)
      end
    end
  end
end
