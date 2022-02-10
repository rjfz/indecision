# frozen_string_literal: true

module Operations
  module UserSubject
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(user_subject:, **params)
          @form = Forms::UserSubject.new(**params).with(user_subject)
          @action = Action.new(user_subject, form)
        end
      end
    end
  end
end
