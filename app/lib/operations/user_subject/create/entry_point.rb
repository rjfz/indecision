# frozen_string_literal: true

module Operations
  module UserSubject
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::UserSubject.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
