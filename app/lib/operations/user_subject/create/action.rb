# frozen_string_literal: true

module Operations
  module UserSubject
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(user_subject)
        end

        private

        attr_reader :form

        def user_subject
          @user_subject ||= ::UserSubject.new(attributes: form.attributes)
        end
      end
    end
  end
end
