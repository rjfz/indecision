# frozen_string_literal: true

module Operations
  module Question
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(question)
        end

        private

        attr_reader :form

        def question
          @question ||= ::Question.new(attributes: form.attributes)
        end
      end
    end
  end
end
