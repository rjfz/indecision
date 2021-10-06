module Operations
  module Lesson
    module Create
      class Action

        def initialize(form)
          @form = form
        end

        def call
          Command.save(lesson)
        end


        private

        attr_reader :form

        def lesson
          @lesson ||= ::Lesson.new(attributes: form.attributes)
        end
      end
    end
  end
end

