module Component
  module Devise
    class ErrorMessage < ViewComponent::Base

      attr_reader :text

      def initialize(text:)
        super

        @text = text
      end
    end
  end
end
