# frozen_string_literal: true

module Operations
  module AnonUserLobby
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::AnonUserLobby.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
