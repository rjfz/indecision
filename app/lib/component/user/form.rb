# frozen_string_literal: true

module Component
  module User
    class Form < ViewComponent::Base
      include Turbo::FramesHelper

      attr_reader :user

      def initialize(user:)
        super

        @user = user
      end

      def courses
        Presenter.from ::Course.all
      end
    end
  end
end
