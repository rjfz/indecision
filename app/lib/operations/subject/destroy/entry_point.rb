# frozen_string_literal: true

module Operations
  module Subject
    module Destroy
      class EntryPoint
        include ::EntryPoint

        def initialize(subject_id:)
          subject = ::Subject.find(subject_id)
          @action = Action.new(subject)
        end
      end
    end
  end
end
