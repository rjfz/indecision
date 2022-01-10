# frozen_string_literal: true

module Operations
  module NameGenerator
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
