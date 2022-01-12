# frozen_string_literal: true

module Component
  module Question
    class AnswersList < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :question

      def initialize(question:)
        super

        @question = question
      end

      def answers
        Presenter.from question.answers
      end
    end
  end
end
