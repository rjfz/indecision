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
          question.assign_attributes(form.attributes)
          Command.save(question)
        end

        private

        attr_reader :form, :question
      end
    end
  end
end
