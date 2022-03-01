# frozen_string_literal: true

module Component
  module Lesson
    class ResponseRateChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lesson

      def initialize(lesson:)
        super

        @lesson = lesson
        responses
      end
      def responses
        lesson.lobbies.group_by(&:year).map {|year, lobbies| [year.academic_year, lobbies.map(&:overall_response_rate).sum.fdiv(lobbies.count)] }.to_h
      end
    end
  end
end
