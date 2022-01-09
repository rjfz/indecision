module Component
  module Course
    class ShowLesson < ViewComponent::Base

      attr_reader :lesson

      def initialize(lesson:)
        super

        @lesson = lesson
      end
    end
  end
end
