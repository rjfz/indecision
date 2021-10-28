# frozen_string_literal: true

module Operations
  module Answer
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Answer.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
