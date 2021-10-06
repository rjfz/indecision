module Operations
  module Lesson
    module Create
      class EntryPoint

        include ::EntryPoint

        def initialize(**params)
          @form = Forms::Lesson.new(**params)
          @action = Action.new(form)
        end
      end
    end
  end
end

