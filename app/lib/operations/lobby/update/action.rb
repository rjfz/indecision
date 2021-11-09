# frozen_string_literal: true

module Operations
  module Lobby
    module Update
      class Action
        def initialize(lobby, form)
          @form = form
          @lobby = lobby
        end

        def call
          lobby.assign_attributes(form.attributes)
          Command.save(lobby)
        end

        private

        attr_reader :form, :lobby

        def lobby
          @lobby ||= ::Lobby.new(attributes: form.attributes)
        end
      end
    end
  end
end
