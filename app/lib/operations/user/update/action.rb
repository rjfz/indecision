# frozen_string_literal: true

module Operations
  module User
    module Update
      class Action
        include UserDependencies['update_user']

        def initialize(user, form, **deps)
          super(**deps)

          @form = form
          @user = user
        end

        def call
          user.assign_attributes(form.attributes)
          Command.save(user)
        end

        private

        attr_reader :form, :user

      end
    end
  end
end
