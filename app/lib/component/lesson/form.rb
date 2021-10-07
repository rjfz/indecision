# frozen_string_literal: true

module Component
  module Lesson
    class Form < ViewComponent::Base

      include Turbo::FramesHelper

      attr_reader :lesson

      def initialize(lesson:)
        super

        @lesson = lesson
      end

      def courses
        Presenter.from ::Course.all
      end
    end
  end
end
