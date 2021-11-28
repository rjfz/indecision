# frozen_string_literal: true

module Component
  module Course
    class Form < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :course

      def initialize(course:)
        super

        @course = course
      end
    end
  end
end
