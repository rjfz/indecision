# frozen_string_literal: true

module Component
  module Lobby
    class Form < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :lobby

      def initialize(lobby:)
        super

        @lobby = lobby
      end

      def lessons
        Presenter.from ::Lesson.all
      end
    end
  end
end
