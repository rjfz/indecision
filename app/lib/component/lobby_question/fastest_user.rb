# frozen_string_literal: true

module Component
  module LobbyQuestion
    class FastestUser < ViewComponent::Base
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

      def fastest_correct_response
        question_start_time = lobby_question.started_at
        answer_ids = lobby_question.question.answers.where(correct: true).ids
        lobby_question.responses.where(answer_id: answer_ids).min_by{ _1.created_at - question_start_time }
      end
    end
  end
end
