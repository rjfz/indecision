# frozen_string_literal: true

module Operations
  module Answer
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(answer).tap do |answer|
            Operations::Question::Update::EntryPoint.call(question: answer.question)
          end
        end

        private

        attr_reader :form

        def answer
          @answer ||= ::Answer.new(attributes: form.attributes)
        end
      end
    end
  end
end
