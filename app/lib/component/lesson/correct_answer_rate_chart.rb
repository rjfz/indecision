# frozen_string_literal: true

module Component
  module Lesson
    class CorrectAnswerRateChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lesson

      def initialize(lesson:)
        super
    @lesson = lesson
      end

      def percentage_correct
        lesson.lobbies.group_by(&:year).map do |year, lobbies|
          percentage = lobbies.map(&:overall_correct_answer_rate).sum.fdiv(lobbies.count)
          percentage = 0 if percentage.nan?
          [
            year.academic_year,
            percentage
          ]
        end.to_h
      end
    end
  end
end
