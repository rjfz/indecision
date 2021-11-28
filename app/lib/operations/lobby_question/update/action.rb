# frozen_string_literal: true

module Operations
  module LobbyQuestion
    module Update
      class Action
        include LobbyDependencies['update_lobby']

        def initialize(lobby_question, form, **deps)
          super(**deps)

          @form = form
          @lobby_question = lobby_question
        end

        def call
          raise IncorrectStateError if lobby_question.state == 'finished'

          lobby_question.assign_attributes attributes
          Command.save(lobby_question).tap do |lobby_question|
            starting(lobby_question)
            finished(lobby_question)
          end
        end

        private

        attr_reader :form, :lobby_question

        def attributes
          form.attributes.tap do |attrs|
            attrs[:started_at] = (Time.now + 5.seconds) if attrs[:state] == 'starting'
          end
        end

        def starting(lobby_question)
          return unless lobby_question.starting?

          StartLobbyQuestionJob.set(wait_until: lobby_question.started_at).perform_later(lobby_question)
          update_lobby.call(lobby: lobby_question.lobby, state: 'started')
        end

        def finished(lobby_question)
          return unless lobby_question.finished? && lobby_question.lobby.lobby_questions.pluck(:state).all?('finished')

          update_lobby.call(lobby: lobby_question.lobby, state: 'finished')
        end
      end
    end
  end
end
