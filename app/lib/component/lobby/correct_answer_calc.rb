# frozen_string_literal: true

module Component
  module Lobby
    class CorrectAnswerCalc < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby

      def initialize(lobby:)
        super

        @lobby = lobby
      end

      def percentage_correct
        questions = lobby.lobby_questions.includes(:question).where(question: { question_type: 'Multiple Choice' })
        questions.map do |lobby_question|
          answer_ids = lobby_question.question.answers.where(correct: true)
          correct_responses = lobby_question.responses.where(answer_id: answer_ids).count
          all_responses = lobby_question.responses.count

          correct_rate = (correct_responses.to_f / all_responses.to_f)
          correct_rate = 0 if correct_rate.nan?

          [lobby_question.question.title, (correct_rate * 100)]
        end.to_h
      end
    end
  end
end
