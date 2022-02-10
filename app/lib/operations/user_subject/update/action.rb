# frozen_string_literal: true

module Operations
  module UserSubject
    module Update
      class Action
        include UserSubjectDependencies['update_user_subject']

        def initialize(user_subject, form, **deps)
          super(**deps)

          @form = form
          @user_subject = user_subject
        end

      end

        private

        attr_reader :form, :user_subject
    end
  end
end
