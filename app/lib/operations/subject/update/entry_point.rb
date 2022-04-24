# frozen_string_literal: true

module Operations
  module Subject
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(subject:, **params)
          @form = Forms::Subject.new(**params).with(subject)
          @action = Action.new(subject, form)
        end
      end
    end
  end
end
