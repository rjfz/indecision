# frozen_string_literal: true

module Operations
  module Question
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Question.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
