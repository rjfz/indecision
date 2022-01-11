# frozen_string_literal: true

module Operations
  module Lesson
    module Update
      class EntryPoint
        include ::EntryPoint

        def initialize(lesson:, **params)
          @form = Forms::Lesson.new(**params).with(lesson)
          @action = Action.new(lesson, form)
        end
      end
    end
  end
end
