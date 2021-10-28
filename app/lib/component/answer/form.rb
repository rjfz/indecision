# frozen_string_literal: true

module Component
  module Answer
    class Form < ViewComponent::Base

      include Turbo::FramesHelper

      attr_reader :answer

      def initialize(answer:)
        super

        @answer = answer
      end

      def lessons
        Presenter.from ::Answer.all
      end
    end
  end
end
