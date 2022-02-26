# frozen_string_literal: true

module Operations
  module Question
    module QuestionType
      class EntryPoint
        include ::EntryPoint

        def initialize(question:)
          @action = Action.new(question)
        end
      end
    end
  end
end
