# frozen_string_literal: true

module Operations
  module Year
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Year.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
