# frozen_string_literal: true

module Component
  module Course
    class ResponseRateChart < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :course

      def initialize(course:)
        super

        @course = course
        responses
      end
      
      def responses
        course.lessons.map(&:lobbies).flatten.group_by(&:year).map {|year, lobbies| [year.academic_year, lobbies.map(&:overall_response_rate).sum.fdiv(lobbies.count)] }.to_h
      end
    end
  end
end
