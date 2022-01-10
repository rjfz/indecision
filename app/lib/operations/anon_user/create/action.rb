# frozen_string_literal: true

module Operations
  module AnonUser
    module Create
      class Action
        include NameGeneratorDependencies['generate_name']
        def call
          Command.save(anon_user)
        end

        private

        def anon_user
          @anon_user ||= ::AnonUser.new(username: generate_name.call )
        end

      end
    end
  end
end
