# frozen_string_literal: true

module Component
  module Lobby
    class ResponseRateCalc < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby

      def initialize(lobby:)
        super

        @lobby = lobby
      end

      def response_rate
        @response_rate ||= lobby.lobby_questions.includes(:question).where.not(question: { question_type: 'Quickfire'}).map do |lobby_question|
          responses = lobby_question.responses.count
          attendees = lobby.anon_users.count

          [lobby_question.question.title, ((responses.to_f / attendees.to_f) * 100)]
        end.to_h
      end
    end
  end
end
