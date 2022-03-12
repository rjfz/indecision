# frozen_string_literal: true

module Operations
  module Course
    module Update
      class Action
        def initialize(course, form)
          @form = form
          @course = course
        end

        def call
          course.assign_attributes(hold_params)
          Command.save(course)
        end

        private

        attr_reader :form, :course

        def hold_params
          form.attributes.tap do |attrs|
            attrs.delete(:image) if attrs[:image].nil?
          end
        end
      end
    end
  end
end
