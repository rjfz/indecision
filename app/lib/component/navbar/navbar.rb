module Component
  module Navbar
    class Navbar < ViewComponent::Base
      attr_reader :title

      def initialize(title:)
        super
        @title = title
      end
    end
  end
end
