# frozen_string_literal: true

module Component
  module Question
    class Form < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :question

      def initialize(question:)
        super

        @question = question
      end

      def lessons
        Presenter.from ::Lesson.all
      end
    end
  end
end
