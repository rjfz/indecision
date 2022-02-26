# frozen_string_literal: true

module Operations
  module Answer
    module Destroy
      class EntryPoint
        include ::EntryPoint

        def initialize(answer_id:)
          answer = ::Answer.find(answer_id)
          @action = Action.new(answer)
        end
      end
    end
  end
end
