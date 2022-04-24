# frozen_string_literal: true

module Operations
  module Subject
    module Update
      class Action
        def initialize(subject, form)
          @form = form
          @subject = subject
        end

        def call
          subject.assign_attributes(form.attributes)
          Command.save(subject)
        end

        private

        attr_reader :form, :subject
      end
    end
  end
end
