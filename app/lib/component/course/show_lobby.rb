module Component
  module Course
    class ShowLobby < ViewComponent::Base

      attr_reader :lobby

      def initialize(lobby:)
        super

        @lobby = lobby
      end
    end
  end
end
