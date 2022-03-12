
# frozen_string_literal: true

module Operations
  module Course
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(course:, **params)
          @form = Forms::Course.new(**params).with(course)
          @action = Action.new(course, form)
        end
      end
    end
  end
end
