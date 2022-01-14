# frozen_string_literal: true

module Component
  module LobbyQuestion
    class ResponsesChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby_question

      def initialize(lobby_question:)
        super

        @lobby_question = lobby_question
      end

      def responses
        @responses ||= lobby_question.responses.group_by(&:answer_id).transform_keys { ::Answer.find _1 }
      end

      def colors
        responses.keys.map{ _1.correct? ? '#00ff55' : '#aa0000' }
      end
    end
  end
end
