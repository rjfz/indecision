# frozen_string_literal: true

module Operations
  module Question
    module Update
      class Action
        def initialize(question, form)
          @form = form
          @question = question
        end

        def call
          question.assign_attributes(attributes)
          Command.save(question)
        end

        private

        attr_reader :form, :question

        def attributes
          form.attributes.merge(question_type: Operations::Question::QuestionType::EntryPoint.call(question: question))
        end
      end
    end
  end
end
