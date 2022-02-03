# frozen_string_literal: true

module Component
  module Year
    class Form < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :year

      def initialize(year:)
        super

        @year = year
      end
    end
  end
end
