# frozen_string_literal: true

module Component
  module Course
    class CorrectAnswerRateChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :course

      def initialize(course:)
        super
    @course = course
      end

      def percentage_correct
        course.lessons.map(&:lobbies).flatten.group_by(&:year).map { |year, lobbies| [year.academic_year, lobbies.map(&:overall_correct_answer_rate).sum.fdiv(lobbies.count)]}.to_h
      end
    end
  end
end
