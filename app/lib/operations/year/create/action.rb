# frozen_string_literal: true

module Operations
  module Year
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(year)
        end

        private

        attr_reader :form

        def year
          @year ||= ::Year.new(attributes: form.attributes)
        end
      end
    end
  end
end
