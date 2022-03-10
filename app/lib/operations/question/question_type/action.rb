# frozen_string_literal: true

module Operations
  module Question
    module QuestionType
      class Action
        def initialize(question)
          @question = question
        end

        def call
          if question.time_limit.zero?
            if question.answers.where(correct: true).any?
              'Quickfire'
            else
              'Invalid'
            end
          else
            if question.answers.any?
              question.answers.where(correct: true).any? ? 'Multiple Choice' : 'Invalid'
            else
              'Open Answer'
            end
          end
        end

        private

        attr_reader :question
      end
    end
  end
end
