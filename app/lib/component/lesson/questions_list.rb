# frozen_string_literal: true

module Component
  module Lesson
    class QuestionsList < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lesson

      def initialize(lesson:)
        super

        @lesson = lesson
      end

      def questions
        Presenter.from lesson.questions
      end
    end
  end
end
