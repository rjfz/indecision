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
        lesson.lobbies.group_by(&:year).map { |year, lobbies| [year.academic_year, lobbies.map(&:overall_correct_answer_rate).sum.fdiv(lobbies.count)]}.to_h
      end
    end
  end
end
