module Operations
  module Subject
    module Create
      class EntryPoint
        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Subject.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end
