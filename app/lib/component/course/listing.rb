# frozen_string_literal: true

module Component
  module Course
    class Listing < ViewComponent::Base

      attr_reader :course

      def initialize(course:)
        super

        @course = course
      end
    end
  end
end
