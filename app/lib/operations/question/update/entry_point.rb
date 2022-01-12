# frozen_string_literal: true

module Operations
  module Question
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(question:, **params)
          @form = Forms::Question.new(**params).with(question)
          @action = Action.new(question, form)
        end
      end
    end
  end
end
