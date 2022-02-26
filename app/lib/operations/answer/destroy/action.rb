# frozen_string_literal: true

module Operations
  module Answer
    module Destroy
      class Action
        def initialize(answer)
          @answer = answer
        end

        def call
          Command.destroy(answer).tap() do |answer|
            Operations::Question::Update::EntryPoint.call(question: answer.question)
        end
      end

        private

        attr_reader :answer
      end
    end
  end
end
