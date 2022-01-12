# frozen_string_literal: true

module Operations
  module Answer
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(answer:, **params)
          @form = Forms::Answer.new(**params).with(answer)
          @action = Action.new(answer, form)
        end
      end
    end
  end
end
