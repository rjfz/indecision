# frozen_string_literal: true

module Operations
  module Response
    module Create
      class Action
        def initialize(form)
          @form = form
        end

        def call
          Command.save(response)
        end

        private

        attr_reader :form

        def response
          @response ||= ::Response.new(attributes: form.attributes)
        end
      end
    end
  end
end
