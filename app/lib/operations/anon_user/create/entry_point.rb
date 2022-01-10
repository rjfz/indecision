# frozen_string_literal: true

module Operations
  module AnonUser
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize
          @action = Action.new
        end
      end
    end
  end
end
