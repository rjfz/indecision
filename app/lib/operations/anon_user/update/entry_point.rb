# frozen_string_literal: true

module Operations
  module AnonUser
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(anon_user:, **params)
          @form = Forms::AnonUser.new(**params).with(anon_user)
          @action = Action.new(anon_user, form)
        end
      end
    end
  end
end
