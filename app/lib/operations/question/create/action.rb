# frozen_string_literal: true

module Operations
  module Question
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          set_question_type
          Command.save(question)
        end

        private

        attr_reader :form

        def question
          @question ||= ::Question.new(attributes: attributes)
        end

        def attributes
          form.attributes
        end

        def set_question_type
          question.question_type = Operations::Question::QuestionType::EntryPoint.call(question: question)
        end
      end
    end
  end
end
