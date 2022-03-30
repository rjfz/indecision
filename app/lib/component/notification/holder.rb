# frozen_string_literal: true

module Component
  module Notification
    class Holder < ViewComponent::Base
      include Turbo::FramesHelper
      include Turbo::StreamsHelper
    end
  end
end
