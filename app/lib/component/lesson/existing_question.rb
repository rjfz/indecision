# frozen_string_literal: true

module Component
  module Lesson
    class ExistingQuestion < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :question

      def initialize(question:)
        super

        @question = question
      end
    end
  end
end
