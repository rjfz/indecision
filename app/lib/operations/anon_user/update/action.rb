# frozen_string_literal: true

module Operations
  module AnonUser
    module Update
      class Action
        def initialize(anon_user, form)
          @form = form
          @anon_user = anon_user
        end

        def call
          anon_user.assign_attributes(form.attributes)
          Command.save(anon_user)
        end

        private

        attr_reader :form, :anon_user
      end
    end
  end
end
