module Component
  module Sidebar
    class Sidebar < ViewComponent::Base
      attr_reader :current_user

      def initialize()
        super
      end
    end
  end
end
