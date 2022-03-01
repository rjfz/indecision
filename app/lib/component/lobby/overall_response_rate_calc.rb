# frozen_string_literal: true

module Component
  module Lobby
    class OverallResponseRateCalc < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby

      def initialize(lobby:)
        super

        @lobby = lobby
      end

      def overall_response_rate
        lobby.overall_response_rate
      end
    end
  end
end
