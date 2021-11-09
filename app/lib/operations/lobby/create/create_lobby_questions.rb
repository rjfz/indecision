module Operations
  module Lobby
    module Create
      class CreateLobbyQuestions

        include LobbyDependencies['create_lobby_question']

        def initialize(lobby, **deps)
          super(**deps)

          @lobby = lobby
        end

        def call
          lobby.lesson.questions.each do |question|
            create_lobby_question.call({lobby_id: lobby.id, question_id: question.id})
          end
        end

        private

        attr_reader :lobby

      end
    end
  end
end
