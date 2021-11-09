# frozen_string_literal: true

module Operations
  module LobbyQuestion
    module Update
      class Action
        def initialize(lobby_question, form)
          @form = form
          @lobby_question = lobby_question
        end

        def call
          lobby_question.assign_attributes attributes
          Command.save(lobby_question).tap do |lobby_question|
            if lobby_question.starting?
              StartLobbyQuestionJob.set(wait_until: lobby_question.started_at).perform_later(lobby_question)
            end
          end
        end

        private

        attr_reader :form, :lobby_question

        def attributes
          form.attributes.tap do |attrs|
            attrs[:started_at] = (Time.now + 5.seconds) if attrs[:state] == 'starting'
          end
        end
      end
    end
  end
end
