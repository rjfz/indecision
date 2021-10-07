module Operations
  module Course
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(course)
        end

        private

        attr_reader :form

        def course
          @course ||= ::Course.new(attributes: form.attributes)
        end
      end
    end
  end
end
