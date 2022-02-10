# frozen_string_literal: true

module Operations
  module User
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(user:, **params)
          @form = Forms::User.new(**params).with(user)
          @action = Action.new(user, form)
        end
      end
    end
  end
end
