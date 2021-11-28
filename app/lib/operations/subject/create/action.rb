# frozen_string_literal: true

module Operations
  module Subject
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(subject)
        end

        private

        attr_reader :form

        def subject
          @subject ||= ::Subject.new(attributes: form.attributes)
        end
      end
    end
  end
end
