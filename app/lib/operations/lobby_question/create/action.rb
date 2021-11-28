# frozen_string_literal: true

module Operations
  module LobbyQuestion
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(lobby_question)
        end

        private

        attr_reader :form

        def lobby_question
          @lobby_question ||= ::LobbyQuestion.new(attributes: form.attributes)
        end
      end
    end
  end
end
