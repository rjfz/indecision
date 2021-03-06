# frozen_string_literal: true

module Component
  module LobbyQuestion
    class UserAnswer < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby_question, :steps

      def initialize(lobby_question:)
        super

        @lobby_question = lobby_question
      end

      def user_answers
        if lobby_question.question.question_type == 'Open Answer'
          @user_answers ||= lobby_question.responses.map do |response|
            [response.anon_user.username, response.answer_text]
          end
          else
        @user_answers ||= lobby_question.responses.map do |response|
          [response.anon_user.username, response.answer.value]
        end
        end.to_h
      end
    end
  end
end
