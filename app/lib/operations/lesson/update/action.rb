# frozen_string_literal: true

module Operations
  module Lesson
    module Update
      class Action
        def initialize(lesson, form)
          @form = form
          @lesson = lesson
        end

        def call
          lesson.assign_attributes(form.attributes)
          Command.save(lesson)
        end

        private

        attr_reader :form, :lesson
      end
    end
  end
end
