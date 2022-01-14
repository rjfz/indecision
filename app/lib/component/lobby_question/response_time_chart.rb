# frozen_string_literal: true

module Component
  module LobbyQuestion
    class ResponseTimeChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby_question, :steps

      def initialize(lobby_question:)
        super

        @lobby_question = lobby_question
        @steps = Hash.new(0)
        responses
      end

      def responses
        question_start_time = lobby_question.started_at
        lobby_question.responses.each do |response|
          index = (response.created_at - question_start_time).ceil
          @steps[index] += 1
        end
      end

    end
  end
end
