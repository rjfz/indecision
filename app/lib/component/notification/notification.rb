# frozen_string_literal: true

module Component
  module Notification
    class Notification < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :text, :style

      def initialize(text:, style:)
        super

        @text = text
        @style = style
      end

      def icon
        styles[style][:icon]
      end

      def icon_color
        styles[style][:icon_color]
      end

      def title
        styles[style][:title]
      end

      private

      def styles
        {
          success: { icon: 'check-circle', icon_color: 'green', title: 'Success!' },
          error: { icon: 'x-circle', icon_color: 'red', title: 'error!' }
        }
      end
    end
  end
end
