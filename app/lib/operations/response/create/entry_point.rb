# frozen_string_literal: true

module Operations
  module Response
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Response.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
