# frozen_string_literal: true

module Operations
  module Lobby
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Lobby.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
