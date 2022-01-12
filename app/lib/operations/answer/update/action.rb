# frozen_string_literal: true

module Operations
  module Answer
    module Update
      class Action
        def initialize(answer, form)
          @form = form
          @answer = answer
        end

        def call
          answer.assign_attributes(form.attributes)
          Command.save(answer)
        end

        private

        attr_reader :form, :answer
      end
    end
  end
end
