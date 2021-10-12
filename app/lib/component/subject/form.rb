module Component
  module Subject
    class Form < ViewComponent::Base

      include Turbo::FramesHelper

      attr_reader :subject

      def initialize(subject:)
        super

        @subject = subject
      end

    end
  end
end
