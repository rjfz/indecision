# frozen_string_literal: true

module Operations
  module AnonUserLobby
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          return if already_exists?

          Command.save(anon_user_lobby)
        end

        private

        attr_reader :form

        def anon_user_lobby
          @anon_user_lobby ||= ::AnonUserLobby.new(**form.attributes)
        end

        def already_exists?
          ::AnonUserLobby.where(**form.attributes.slice(:anon_user_id, :lobby_id)).any?
        end
      end
    end
  end
end
