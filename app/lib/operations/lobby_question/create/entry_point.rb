# frozen_string_literal: true

module Operations
  module LobbyQuestion
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::LobbyQuestion.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
