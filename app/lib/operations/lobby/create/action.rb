# frozen_string_literal: true

module Operations
  module Lobby
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(lobby)
        end

        private

        attr_reader :form

        def lobby
          @lobby ||= ::Lobby.new(attributes: form.attributes)
        end
      end
    end
  end
end
