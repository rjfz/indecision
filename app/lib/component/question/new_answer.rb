# frozen_string_literal: true

module Component
  module Question
    class NewAnswer < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :answer

      def initialize(answer:)
        super

        @answer = answer
      end
    end
  end
end
