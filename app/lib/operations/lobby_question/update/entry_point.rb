# frozen_string_literal: true

module Operations
  module LobbyQuestion
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(lobby_question:, **params)
          @form = Forms::LobbyQuestion.new(**params).with(lobby_question)
          @action = Action.new(lobby_question, form)
        end
      end
    end
  end
end
