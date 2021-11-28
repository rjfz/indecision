# frozen_string_literal: true

module Operations
  module Course
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Course.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
