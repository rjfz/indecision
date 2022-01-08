module Component
  module Subject
    class Listing < ViewComponent::Base

      attr_reader :subject

      def initialize(subject:)
        super

        @subject = subject
      end

      def courses
        @courses ||= subject.courses
      end
    end
  end
end
