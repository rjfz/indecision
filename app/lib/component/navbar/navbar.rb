module Component
  module Navbar
    class Navbar < ViewComponent::Base
      attr_reader :title, :current_user

      def initialize(title:, current_user:)
        super
        @title = title
        @current_user = current_user
      end
    end
  end
end
